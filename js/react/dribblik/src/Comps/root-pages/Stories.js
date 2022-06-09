import React from "react";
import Awards from '../Awards'

function Stories({themeb}) {
    return (
        <div style={{background: themeb.background, color: themeb.color}}>
            <Awards themeb={themeb}/>
            <p className="mt">Stories page</p>
        </div>
    )
}

export default Stories