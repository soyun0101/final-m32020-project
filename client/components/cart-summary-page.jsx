import React from 'react';
import CartSummaryItem from './cart-summary-item';
import { Link } from 'react-router-dom';

export default class CartSummaryPage extends React.Component {
  constructor(props) {
    super(props);

    this.priceTotal = 0;

    this.handleContinueShoppingClick = this.handleContinueShoppingClick.bind(this);
  }

  handleContinueShoppingClick() {

  }

  render() {

    return (
      <div>
        <div>
          <Link to="/products" className="link-page" style={ { cursor: 'pointer' } }>
            {'< Continue shopping'}
          </Link>
        </div>

        <div className="mt-3">
          <h3>Cart Summary</h3>
        </div>
        {
          (() => {
            if (!this.props.cartItems.length) {
              return <h5 className="ml-2">You have no items in your cart</h5>;
            } else {
              return (
                <>
                  <div className="container mt-2">
                    <div className="row">
                      {
                        this.props.cartItems.map(eachCartProductInfo => {

                          const { productId, image, name, price } = eachCartProductInfo;

                          const dividedPrice = price / 100;

                          this.priceTotal = this.priceTotal + dividedPrice;

                          return <div key={productId}>
                            <CartSummaryItem productId={productId} image={image} name={name} price={dividedPrice} />
                          </div>;
                        })
                      }

                    </div>
                  </div>

                  <div className="float-right mt-3 mr-3">
                    <h5>Item Total: <span>{`$${this.priceTotal.toFixed(2)}`}</span></h5>
                    <div className="mt-3 ml-4">
                      <button className="btn btn-info">Check out</button>
                    </div>
                  </div>

                </>
              );
            }
          })()
        }

      </div>
    );
  }

}
