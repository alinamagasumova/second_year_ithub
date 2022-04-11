import React, {useState} from "react";

function Title(props) {
    const {header} = props
    return (
        <div>
            {header.map((get) => <div><h5>{get.title}</h5><p>{get.text}</p></div>)}
        </div>
    )
}

export default Title;