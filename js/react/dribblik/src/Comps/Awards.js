import React from "react";
import { useContext } from "react";
import { ThemeContext } from "../theme-context";

function Awards({themeb}) {
    return (
        <div className="Awards" style={{background: themeb.background, color: themeb.color}}>
            <div className="award gray">good<br/>design</div>
            <div className="award" style={{'textAlign': 'right'}}><p><b>Japan Design Award</b><br/>2018</p></div>
            <div className="award prd"><p><b>PRODUCT DESIGN</b><br/>AWARD</p></div>
            <div className="award" style={{'alignItems':'center', 'justifyContent': 'center'}}><p><b>DUTCH DESIGN AWARD</b></p></div>
            <div className="award bord"><p><b>inter&shy;national design awards</b></p></div>
            <div className="award fur"><p>FURNITURE DESIGN AWARD</p></div>
        </div>
    )
}

export default Awards;