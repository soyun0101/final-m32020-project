import React from 'react';

import AllProductsList from './all-products';

export default class ProductsPage extends React.Component {
  constructor() {
    super();

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
        name: name,
        params: params
      }
    });
  }

  render() {

    return <div>
      {
        (() => {
          switch (this.state.view.name) {
            case 'catalog': return <AllProductsList />;

          }
        })()
      }

    </div>;

  }
}
