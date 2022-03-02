import React from "react";

function TitleList(props) {
    const header = props.header
    return (
        <div>
            {header.map((get) => <div><h3>{get.title}</h3><p>{get.text}</p></div>)}
        </div>
    )
}

export default TitleList;