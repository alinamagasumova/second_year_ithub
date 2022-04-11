import React, { useState } from "react";
import AddItem from "./AddItem";
import TodoList from "./TodoList";
// import TodoContext from "../Context/todocontext";

const start_todos = [
  {id: 1, title: 'one', completed: false},
  {id: 2, title: 'two', completed: false},
  {id: 3, title: 'three', completed: false},
]

function App() {
  const [todos, setTodos] = useState(start_todos);

  const addTodo = title => setTodos([
    ...todos, {id:Date.now(), title: title, completed: true}
  ])

  const deleteTodo = (id) => {
    setTodos(todos.filter((elem)=> elem.id !== id))
  }

  const changeTodo = (id) => {
    setTodos(todos.map((elem)=> {
      if (elem.id === id) {
        elem.completed = !elem.completed
      }
    }))
  }

  return (
    <div>
      {/* <TodoContext.Provider value = {{deleteTodo, changeTodo}}/> */}
      <AddItem addTodo = {addTodo}/>
      <TodoList todos = {todos} deleteTodo={deleteTodo} changeTodo={changeTodo}/>
    </div>
  )
}

export default App;
