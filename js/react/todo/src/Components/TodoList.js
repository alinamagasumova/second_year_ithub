import React from "react";
import TodoItem from "./TodoItem";

function TodoList(props) {
    const {todos, deleteTodo, changeTodo} = props
    return(
        <div>
            {todos.map((todo) => <TodoItem id = {todo.id} title = {todo.title} completed = {todo.completed} changeTodo ={changeTodo} deleteTodo = {deleteTodo} 
            />)} 

        </div>
    )
}

export default TodoList