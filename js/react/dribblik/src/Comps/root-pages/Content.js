import React from "react";
import Header from "../Header";
import Main from "../Main";
import Awards from "../Awards";
import { useContext } from "react";
import { ThemeContext } from "../../theme-context";

function Content({themeb, handler}) {
    const theme = useContext(ThemeContext)
    return (
        <div style={{background: themeb.background, color: themeb.color}}>
            <Header themeb={themeb} handler={handler}/>
            <Main themeb={themeb}/>
            <Awards themeb={themeb}/>
        </div>
    )
}

export default Content;