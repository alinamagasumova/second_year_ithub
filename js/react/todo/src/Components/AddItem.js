import React from "react";

function AddItem(props) {
    const {addTodo} = props; 
 
    function addhandler(e) { 
        if (e.key === "Enter") { 
            addTodo(e.target.value); 
        } 
    } 
    return ( 
        <div> 
            <input onKeyDown={addhandler} placeholder="New Task"></input> 
        </div> 
    )
}


export default AddItem