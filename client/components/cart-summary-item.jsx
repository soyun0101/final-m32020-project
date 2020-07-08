import React from 'react';

export default class CartSummaryItem extends React.Component {

  render() {

    const dividedPrice = this.props.price / 100;

    const formattedPrice = dividedPrice.toFixed(2);

    return (
      <div className="card view-all-cards mt-3 ml-2" style={ { maxWidth: '350px' } }>

        <div className="row no-gutters">
          <div className="col-7 mb-2">
            <img src={this.props.image} className="card-img pb-2px" alt="image of each tea product"/>
          </div>
          <div className="col-5">
            <div className="card-body">
              <h6 className="card-title mt-4 ml-2">{this.props.name}</h6>
              <p className="ml-2">${formattedPrice}</p>
              <div>
                <button className="btn btn-danger btn-sm">Delete item</button>
              </div>
            </div>

          </div>
        </div>

      </div>
    );
  }

}
