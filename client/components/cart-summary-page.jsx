import React from 'react';
import CartSummaryItem from './cart-summary-item';
import { Link } from 'react-router-dom';

export default class CartSummaryPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      totalPrice: 0
    };

    this.handleCheckoutClick = this.handleCheckoutClick.bind(this);
    this.processTotal = this.processTotal.bind(this);

  }

  componentDidMount() {

    this.props.setCartView('cartSummary');

    this.processTotal();

  }

  handleCheckoutClick() {

    this.props.setCartView('placeOrder');
  }

  processTotal() {
    const items = this.props.cartItems;
    const totalPrice = [];
    items.map(item => {
      const dividedPrice = item.price / 100;
      totalPrice.push(dividedPrice);
    });

    const finalPrice = totalPrice.reduce(function (a, b) {
      return a + b;
    }, 0);

    this.setState({
      totalPrice: finalPrice
    });
  }

  render() {

    return (
      <div>
        <div>
          <Link to="/products" className="link-page ml-2" style={ { cursor: 'pointer', color: 'black' } }>
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

                          const { productId, image, name, price } = eachCartProductInfo;

                          return <div key={productId}>
                            <CartSummaryItem productId={productId} image={image} name={name} price={price} />
                          </div>;
                        })

                      }
                    </div>
                  </div>

                  <div className="float-right mt-3 mr-3">
                    <h5>Item Total: <span>{`$${this.state.totalPrice.toFixed(2)}`}</span></h5>
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
