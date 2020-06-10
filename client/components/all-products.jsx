import React from 'react';
import ProductItem from './product-item';

export default class AllProductsList extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      products: [],
      message: null
    };

    this.getAllProducts = this.getAllProducts.bind(this);
  }

  componentDidMount() {
    this.getAllProducts();
  }

  getAllProducts() {

    fetch('/api/products')
      .then(result => result.json())
      .then(data => this.setState({ products: data }))
      .catch(err => this.setState({ message: err.message }));
  }

  render() {

    return (
      <div className="container">
        <div className="row">
          {
            this.state.products.map(eachProductInfo => {
              const { productId, image, name, price } = eachProductInfo;

              const dividedPrice = price / 100;

              return <div key={productId}>
                <ProductItem productId={productId} image={image} name={name} price={dividedPrice} />
              </div>;
            })
          }

        </div>

      </div>
    );

  }

}
