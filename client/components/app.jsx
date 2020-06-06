import React from 'react';
import { Switch, Route } from 'react-router-dom';
import Header from './header';
import MainPage from './main-page';
import ProductsPage from './products-page';
import AboutUs from './about-us-page';
import ContactUs from './contact-us-page';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      message: null,
      isLoading: true
    };
  }

  componentDidMount() {
    fetch('/api/health-check')
      .then(res => res.json())
      .then(data => this.setState({ message: data.message || data.error }))
      .catch(err => this.setState({ message: err.message }))
      .finally(() => this.setState({ isLoading: false }));
  }

  render() {
    return this.state.isLoading
      ? <h1>Testing connections...</h1>
      : (<div>
        <Header />
        <Switch>
          <Route exact path="/" component={MainPage}/>
          <Route exact path="/products" component={ProductsPage}/>
          <Route exact path="/about" component={AboutUs}/>
          <Route exact path="/contact" component={ContactUs}/>
        </Switch>
      </div>);
  }
}
