import React from 'react';

export default class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      name: '',
      creditCard: 0,
      shippingAddress: ''
    };

    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);

  }

  handleInput(e) {
    e.preventDefault();

    this.setState({
      [e.target.name]: e.target.value
    });

  }

  handleSubmit(e) {
    e.preventDefault();

    this.props.placeOrder(this.state.name, this.state.creditCard, this.state.shippingAddress);

    this.setState({
      name: '',
      creditCard: 0,
      shippingAddress: ''
    });

    this.props.setCartView('cartSummary');
  }

  render() {

    return (

      <form onSubmit={this.handleSubmit}>
        <div>
          <h3>My Cart</h3>
        </div>
        <div>
          <h5>Item total: <span></span></h5>
        </div>
        <div className="form-group">
          <label>Name:
            <input type="text" className="form-control" name="name" placeholder="Enter name" onChange={this.handleInput}/>
          </label>
        </div>
        <div className="form-group">
          <label>Credit Card:
            <input type="number" className="form-control" name="creditCard" placeholder="Enter credit card" onChange={this.handleInput}/>
          </label>
        </div>
        <div className="form-group">
          <label>Shipping Address:
            <textarea className="form-control" name="shippingAddress" rows="4" placeholder="Enter shipping address" onChange={this.handleInput}></textarea>
          </label>
        </div>
        <div className="form-buttons">
          <button type="" className="btn btn-danger">Cancel</button>
          <button type="submit" className="btn btn-primary ml-2 mr-2">Place Order</button>
        </div>

      </form>

    );
  }

}
