require('dotenv/config');
const express = require('express');

const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');

const app = express();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

app.get('/api/health-check', (req, res, next) => {
  db.query('select \'successfully connected\' as "message"')
    .then(result => res.json(result.rows[0]))
    .catch(err => next(err));
});

app.get('/api/products', (req, res, next) => {

  const sqlGetProducts = `
      SELECT "productId",
              "name",
              "price",
              "image"
        FROM "products";
  `;

  db.query(sqlGetProducts)
    .then(result => {
      res.status(200).json(result.rows);
    })
    .catch(err => next(err));
});

app.get('/api/products/:productId', (req, res, next) => {

  const { productId } = req.params;

  const sqlGetProductDetail = `
      SELECT "productId",
              "name",
              "price",
              "image",
              "shortDescription"
        FROM "products"
        WHERE "products"."productId" = ${productId};
  `;

  db.query(sqlGetProductDetail)
    .then(result => {
      res.status(200).json(result.rows);
    })
    .catch(err => next(err));
});

app.get('/api/cart', (req, res, next) => {

  if (!req.session.cartId) {
    return res.json([]);
  } else {

    const sqlGetCart = `
      SELECT "c"."cartItemId",
            "c"."price",
            "p"."productId",
            "p"."image",
            "p"."name"
      FROM "cartItems" as "c"
      JOIN "products" as "p" using ("productId")
      WHERE "c"."cartId" = ${req.session.cartId}
    `;

    db.query(sqlGetCart)
      .then(result => {
        res.status(200).json(result.rows);
      })
      .catch(err => next(err));
  }

});

app.post('/api/cart/:productId', (req, res, next) => {

  const { productId } = req.params;

  if (productId > 0) {
    const sqlCart = `
        SELECT "price"
          FROM "products"
          WHERE "products"."productId" = ${productId}
      `;
    db.query(sqlCart)
      .then(result => {
        if (!result.rows[0]) {
          return res.json({ message: 'no matching products available' });
        } else {

          const sqlInsertCartId = `
                INSERT INTO "carts" ("cartId", "createdAt")
                  VALUES (default, default)
                  RETURNING "cartId"
              `;

          return db.query(sqlInsertCartId)
            .then(cartIdResult => {

              req.session.cartId = cartIdResult.rows[0].cartId;
              if (req.session.cartId) {
                return {
                  cartId: req.session.cartId,
                  price: result.rows[0].price
                };
              }

            }); /* ending for sqlInsertCartId.then */
        } /* ending for else statment on if(!result.rows[0]) */
      }) /* ending for sqlCart.then */
      .then(response => {

        const params = [
          response.cartId,
          req.params.productId,
          response.price
        ];

        const sqlInsertIntoCartItems = `
                  INSERT INTO "cartItems" ("cartId", "productId", "price")
                        VALUES ($1, $2, $3)
                      RETURNING "cartItemId"
            `;

        return db.query(sqlInsertIntoCartItems, params)
          .then(cartItemIdResult => {
            return cartItemIdResult.rows[0];
          }) /* apart of the cartITEMIdResult then statement */
          .then(lastResponse => {

            const sqlRetrieveCartItems = `
                  SELECT "c"."cartItemId",
                          "c"."price",
                          "p"."productId",
                          "p"."image",
                          "p"."name"
                    FROM "cartItems" as "c"
                    JOIN "products" as "p" using ("productId")
                    WHERE "c"."cartItemId" = ${lastResponse.cartItemId}
              `;
            return db.query(sqlRetrieveCartItems)
              .then(cartItems => { return res.status(201).json(cartItems.rows[0]); });
          });/* ending for the lastResponse.then */

      })
      .catch(err => next(err));
  } else {
    return res.json({ message: 'productId has to be a positive integer' });

  } /* ending for if(productId > 0) else statement */
}); /* ending for app.post */

app.post('/api/orders', (req, res, next) => {

  const { cartId } = req.session;

  // console.log('cartid is: ', cartId);

  const { name, creditCard, shippingAddress } = req.body;

  const params = [
    req.session.cartId,
    req.body.name,
    req.body.creditCard,
    req.body.shippingAddress
  ];

  if (!cartId) {
    res.status(400).json({ error: 'No cartId for the session order' });
  } else if (name && creditCard && shippingAddress) {

    const sqlOrders = `
      INSERT INTO "orders" ("cartId", "name", "creditCard", "shippingAddress")
       VALUES ($1, $2, $3, $4)
       RETURNING "orderId",
                  "createdAt",
                  "name",
                  "creditCard",
                  "shippingAddress"
    `;

    db.query(sqlOrders, params)
      .then(result => {

        return res.status(200).json(result.rows[0]);
      });

    delete req.session.cartId;
    // console.log('req.session.cartId is: ', req.session.cartId);

  }

}); /* ending for app.post orders */

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});
