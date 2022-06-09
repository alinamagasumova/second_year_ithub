import React from "react";
import Main from "../Main";

function About({themeb}) {
    return (
        <div style={{background: themeb.background, color: themeb.color}}>
            <Main themeb={themeb}/>
            <p className="mt">About page</p>
        </div>

    )
}

export default About