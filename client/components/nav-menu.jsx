import React from 'react';

export default function NavMenu() {

  return (
    <div className="mobile-container">
      <div className="topnav">
        <a href="#home" className="active">Logo</a>
        <div id="myLinks">
          <a href="#news">News</a>
          <a href="#contact">Contact</a>
          <a href="#about">About</a>
        </div>
        {/* <a href="javascript:void(0);" class="icon" onclick="myFunction()"> */}
        {/* <i class="fa fa-bars"></i>
                </a> */}
      </div>
    </div>
  );
}
