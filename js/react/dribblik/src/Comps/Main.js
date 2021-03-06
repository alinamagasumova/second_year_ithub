import React from "react";
import Cup from "../imgs/cup.png";
import Bott from "../imgs/bott.png";
import Kastr from "../imgs/kastr.png";
import Circle from "../imgs/circle.png"
import { useContext } from "react";
import { ThemeContext } from "../theme-context";

function Main({themeb}) {
    const theme = useContext(ThemeContext)
    return (
        <main style={{background: themeb.background, color: themeb.color}}>
            <div style={{"position": "relative"}}>
                <h1>Handcrafted Ceramics<br/>for Everyday Life</h1><i className="fa-solid fa-certificate spin"></i>
                <div className="bottleDiv"><img src={Bott} alt='bottle' className="imgBott"/><p>Got the International Design Award on 2020</p></div>
                <img src="https://free-png.ru/wp-content/uploads/2021/05/free-png.ru-115.png" alt="arrow" className="arrow"/>
            </div>

            <div style={{"position": "relative"}}>
            <img src={Cup} alt='cup' className="imgCup"/>
            <a href='/dribble_proj/products'><img src={Circle} alt='circle' className="imgCircle"/></a>
            <a href="/dribble_proj/products" className="allPr">VIEW ALL PRODUCTS</a>
            <div className='kastrDiv'><img src={Kastr} alt='kastr' className="imgKastr"/><p>Every item created in our studio is carefully crafted with a focus on the smallest detail. The art of pottery is our inspiration and passion.</p></div>
            </div>
        </main>
    )
}

export default Main;