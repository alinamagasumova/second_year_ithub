import React, {useContext} from "react";
import TodoContext from "../Context/todocontext";

function TodoItem(props) {
    const {title, id, completed, changeTodo, deleteTodo} = props
    const {changeTodo, deleteTodo} = 

    return  (
        <div onDoubleClick={()=>deleteTodo(id)} onClick={()=>changeTodo(id)}>
            <p>{title}</p> 
            <p>{''+completed}</p> 
        </div>
    )
}

export default TodoItem