import React from 'react';

export default class ProductDetail extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      product: [],
      message: null
    };

    this.handleBackToCatalogClick = this.handleBackToCatalogClick.bind(this);
    this.getProductDetail = this.getProductDetail.bind(this);

  }

  componentDidMount() {
    this.getProductDetail();
  }

  getProductDetail() {

    fetch(`/api/products/${this.props.params.params}`)
      .then(result => result.json())
      .then(data => { return this.setState({ product: data[0] }); })
      .catch(err => { return this.setState({ message: err.message }); });
  }

  handleBackToCatalogClick() {
    this.props.setView('catalog', {});
  }

  render() {

    const { productId, image, name, price, shortDescription } = this.state.product;

    const formatPrice = price / 100;
    const fixedPrice = formatPrice.toFixed(2);

    const handleAddCartClick = () => {
      // console.log('in handleAddCartClick ');
      this.props.addCart(this.state.product);
    };

    return (

      <div>
        <div onClick={this.handleBackToCatalogClick} className="ml-2" style={ { cursor: 'pointer' } }>
          {'< Back to products'}
        </div>

        <div className="card card-detail mx-auto text-center" style={ { width: '18rem' } } key={productId}>
          <img src={image} className="card-img-top" alt="individual tea leaves image" />
          <div className="card-body">
            <h5 className="card-title">{name}</h5>
            <p className="card-text">{`$${fixedPrice}`}</p>
            <p className="card-text">{shortDescription}</p>
            <button onClick={handleAddCartClick} className="btn btn-primary">Add To Cart</button>
          </div>
        </div>

      </div>

    );
  }
}
