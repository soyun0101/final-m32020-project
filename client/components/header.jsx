import React from 'react';
import { Link } from 'react-router-dom';

export default class Header extends React.Component {
  constructor() {
    super();

    this.state = {
      isToggled: false
    };

    this.toggleNavClick = this.toggleNavClick.bind(this);
  }

  toggleNavClick() {

    const navMenu = document.getElementById('myLinks');

    if (!this.state.isToggled) {

      navMenu.classList.remove('hide-nav-menu');
      this.setState({
        isToggled: true
      });
    } else {
      navMenu.classList.add('hide-nav-menu');
      this.setState({
        isToggled: false
      });
    }
  }

  render() {
    return (
      <div>
        <div className="header">
          <i className="fa fa-bars menu-icon" onClick={this.toggleNavClick}></i>
          <h1 className="title">Tea Time</h1>
          {/* <div className="cart-icon"> */}
          <Link to="/cart-summary" className="cart-icon link-page">
            <i className="fa fa-shopping-cart cart-icon"><span className="badge badge-notify">{this.props.cartItemCount}</span></i>
          </Link>
          {/* </div> when added this div, it created an extra space between header and contents below (maybe nav bar?) also caused width to shorten */}
        </div>
        <div className="topnav">
          <div id="myLinks" className="hide-nav-menu">
            <Link to="/" className="link-page" >Home</Link>
            <Link to="/products" className="link-page" >Products</Link>
            <Link to="/contact" className="link-page" >Contact</Link>
            <Link to="/about" className="link-page" >About</Link>
          </div>
        </div>
      </div>
    );
  }

}
