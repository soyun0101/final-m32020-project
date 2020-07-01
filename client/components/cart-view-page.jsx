import React from 'react';
import CartSummaryPage from './cart-summary-page';
import CheckoutForm from './place-order-page';

export default class CartViewPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      view: {
        name: 'cartSummary'
      }
    };

    this.setCartView = this.setCartView.bind(this);
  }

  componentDidMount() {
    this.setCartView('cartSummary');
  }

  setCartView(name) {
    this.setState({
      view: {
        name: name
      }
    });
  }

  render() {

    return (

      <div>

        {
          (() => {

            switch (this.state.view.name) {
              case 'cartSummary': return <CartSummaryPage setCartView={this.setCartView} cartItems={this.props.cartItems} />;
              case 'placeOrder': return <CheckoutForm setCartView={this.setCartView} params={this.state.view.params} placeOrder={this.props.placeOrder}/>;
            }
          })()
        }
      </div>
    );
  }

}
