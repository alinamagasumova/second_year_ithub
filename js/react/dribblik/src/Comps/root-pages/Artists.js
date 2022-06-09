import React from "react";
import Awards from '../Awards'

function Artists({themeb}) {
    return (
        <div style={{background: themeb.background, color: themeb.color}}>
            <p className="mt">Artists page</p>
            <Awards themeb={themeb}/>
        </div>
    )
}

export default Artists