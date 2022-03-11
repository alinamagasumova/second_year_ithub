import React from "react";

function Header() {
    return (
        <header>
            <h2>Clay<span>.</span>co</h2>
            <nav className="list">
                <a href="About">About</a>
                <a href="Products">Shop</a>
                <a href="Artists">Artists</a>
                <a href="Stories">Stories</a>
            </nav>
            <div className="icons">
            <i className="fa-solid fa-magnifying-glass head-icon"></i>
            <i className="fa-solid fa-cart-shopping ml head-icon"></i>
            </div>
        </header>
    )
}

export default Header;