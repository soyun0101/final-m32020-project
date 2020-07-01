import React from 'react';
import { Switch, Route } from 'react-router-dom';
import Header from './header';
import MainPage from './main-page';
import ProductsPage from './products-page';
import AboutUs from './about-us-page';
import ContactUs from './contact-us-page';
import CartViewPage from './cart-view-page';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      message: null,
      isLoading: true,
      cart: []
    };

    this.getCartItems = this.getCartItems.bind(this);
    this.addToCart = this.addToCart.bind(this);
    this.placeOrder = this.placeOrder.bind(this);

    this.cartArray = [];

  }

  componentDidMount() {
    fetch('/api/health-check')
      .then(res => res.json())
      .then(data => this.setState({ message: data.message || data.error }))
      .catch(err => this.setState({ message: err.message }))
      .finally(() => this.setState({ isLoading: false }));

    this.getCartItems();

  }

  getCartItems() {
    fetch('/api/cart')
      .then(res => res.json());

  }

  addToCart(product) {
    // console.log('in addToCart and product is :', product);

    const options = {
      method: 'POST',
      body: JSON.stringify(product),
      headers: {
        'Content-Type': 'application/json'
      }
    };
    fetch(`/api/cart/${product.productId}`, options)
      .then(res => res.json())
      .then(data => {
        this.cartArray.push(data); /* if cart items double,the issue may be here */
        // console.log('this.cartArray is: ', this.cartArray);
        this.setState({ cart: this.cartArray });
      });

  }

  placeOrder(name, creditCard, shippingAddress) {

    this.setState({
      cart: []
    });

    const data = {
      name: name,
      creditCard: creditCard,
      shippingAddress: shippingAddress
    };
    const options = {
      method: 'POST',
      body: JSON.stringify(data),
      headers: {
        'Content-Type': 'application/json'
      }
    };
    fetch('/api/orders', options)
      .then(res => res.json());

  }

  render() {
    return this.state.isLoading
      ? <h1>Testing connections...</h1>
      : (<div>
        <Header cartItemCount={this.state.cart.length}/>
        <Switch>
          <Route exact path="/" component={MainPage}/>
          <Route exact path="/products" render={addCart => (<ProductsPage addCart={this.addToCart}/>)}/>
          <Route exact path="/about" component={AboutUs}/>
          <Route exact path="/contact" component={ContactUs}/>
          <Route exact path="/cart-summary" render={cartItems => <CartViewPage cartItems={this.state.cart} placeOrder={this.placeOrder}/>}/>
        </Switch>
      </div>);
  }
}
