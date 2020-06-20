import React from 'react';
import AllProductsList from './all-products';
import ProductDetail from './product-detail';

export default class ProductsPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      view: {
        name: 'catalog',
        params: {}
      }
    };

    this.setView = this.setView.bind(this);

  }

  componentDidMount() {
    this.setView('catalog', {});
  }

  setView(name, params) {
    this.setState({
      view: {
        name,
        params
      }
    });
  }

  render() {

    return (
      <div>
        {
          (() => {
            switch (this.state.view.name) {
              case 'catalog': return <AllProductsList setView={this.setView}/>;
              case 'detail': return <ProductDetail setView={this.setView} params={this.state.view.params} addCart={this.props.addCart}/>;
            }
          })()
        }
      </div>
    );

  }
}
