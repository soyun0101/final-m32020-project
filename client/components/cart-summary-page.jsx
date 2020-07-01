import React from 'react';
import CartSummaryItem from './cart-summary-item';
import { Link } from 'react-router-dom';

export default class CartSummaryPage extends React.Component {
  constructor(props) {
    super(props);

    this.handleCheckoutClick = this.handleCheckoutClick.bind(this);

    this.totalPrice = 0;

  }

  componentDidMount() {

    this.props.setCartView('cartSummary');
  }

  handleCheckoutClick() {
    // console.log('in handleCheckoutClick');

    this.props.setCartView('placeOrder');
  }

  render() {

    return (
      <div>
        <div>
          <Link to="/products" className="link-page ml-2" style={ { cursor: 'pointer' } }>
            {'< Continue shopping'}
          </Link>
        </div>

        <div className="mt-3 ml-2">
          <h3>Cart Summary</h3>
        </div>
        {
          (() => {
            if (!this.props.cartItems.length) {
              return <h5 className="ml-3">You have no items in your cart</h5>;
            } else {
              return (
                <>
                  <div className="container mt-2">
                    <div className="row">
                      {
                        this.props.cartItems.map(eachCartProductInfo => {

                          // console.log('eachCartProductInfo is: ', eachCartProductInfo);

                          const { productId, image, name, price } = eachCartProductInfo;

                          const dividedPrice = price / 100;

                          this.totalPrice = this.totalPrice + dividedPrice;

                          return <div key={productId}>
                            <CartSummaryItem productId={productId} image={image} name={name} price={price} />
                          </div>;
                        })

                      }
                    </div>
                  </div>

                  <div className="float-right mt-3 mr-3">
                    <h5>Item Total: <span>{`$${this.totalPrice.toFixed(2)}`}</span></h5>
                    <div className="mt-3 ml-4">
                      <button className="btn btn-info" onClick={this.handleCheckoutClick}>Check out</button>
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

// (() => {
//   if (!this.props.cartItems.length) {
//     return <h5 className="ml-3">You have no items in your cart</h5>;
//   } else {
//     return (
//       <>
//         <div className="container mt-2">
//           <div className="row">
//             {
//               this.props.cartItems.map(eachCartProductInfo => {

//                 console.log('eachCartProductInfo is: ', eachCartProductInfo)

//                 const { productId, image, name, price } = eachCartProductInfo;

//                 const dividedPrice = price / 100;

//                 this.priceTotal = this.priceTotal + dividedPrice;

//                 console.log(this.priceTotal);

//                 return <div key={productId}>
//                   <CartSummaryItem productId={productId} image={image} name={name} price={dividedPrice} />
//                 </div>;
//               })
//             }

//           </div>
//         </div>

//         <div className="float-right mt-3 mr-3">
//           <h5>Item Total: <span>{`$${this.priceTotal.toFixed(2)}`}</span></h5>
//           <div className="mt-3 ml-4">
//             <button className="btn btn-info" onClick={handleCheckoutClick}>Check out</button>
//           </div>
//         </div>

//       </>
//     );
//   }
// })()
