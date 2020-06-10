import React from 'react';

export default class ProductItem extends React.Component {
  constructor(props) {
    super(props);

    this.handleTitleClick = this.handleTitleClick.bind(this);
  }

  handleTitleClick() {

  }

  render() {
    return (
      <div className="card mt-5 ml-2" style={ { maxWidth: '350px' } }>

        <div className="row no-gutters">
          <div className="col-7 mb-2">
            <img src={this.props.image} className="card-img pb-2px" alt="image of each tea product"/>
          </div>
          <div className="col-5">
            <div className="card-body">
              <h6 className="card-title mt-4 ml-2">{this.props.name}</h6>
              <p className="ml-2">${this.props.price.toFixed(2)}</p>
            </div>
          </div>
        </div>

      </div>
    );
  }
}
