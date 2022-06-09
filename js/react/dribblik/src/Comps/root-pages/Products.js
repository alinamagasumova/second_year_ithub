import React from "react";
import Main from "../Main";

function Products({themeb}) {
    return (
        <div style={{background: themeb.background, color: themeb.color}}>
            <p className="mt">Products page</p>
            <Main themeb={themeb}/>
        </div>
    )
}

export default Products