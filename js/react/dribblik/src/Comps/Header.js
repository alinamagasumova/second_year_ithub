import React from "react";

function Header({themeb, handler}) {

    return (
        <header style={{background: themeb.background, color: themeb.color}}>
            <a href="/dribble_proj/" className="noLinkSt" style={{color: themeb.header_color}}><h2>Clay<span>.</span>co</h2></a>
            <nav className="list">
                <a href="/dribble_proj/about" style={{color: themeb.header_color}}>About</a>
                <a href="/dribble_proj/products" style={{color: themeb.header_color}}>Shop</a>
                <a href="/dribble_proj/artists" style={{color: themeb.header_color}}>Artists</a>
                <a href="/dribble_proj/stories" style={{color: themeb.header_color}}>Stories</a>
            </nav>
            <div className="icons">
            <i className="fa-solid fa-moon head-icon" onClick={()=>handler()}></i>
            <i className="fa-solid fa-magnifying-glass ml head-icon"></i>
            <i className="fa-solid fa-cart-shopping ml head-icon"></i>
            </div>
        </header>
    )
}

export default Header;