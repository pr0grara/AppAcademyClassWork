import React from "react";
import ReactDOM from "react-dom";
// import App from "./components/app";
import Root from './components/root';
import configureStore from './store/store';
import { receiveTodo, receiveTodos } from "./actions/todo_actions";
import allTodos from "./reducers/selector"

document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main")
  const store = configureStore();
  ReactDOM.render(<Root store={store}/>, main)   // << ASK TA
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.allTodos = allTodos;
})

// function Root() {
//   return (
//     <div>
//       <h1>ToDo's App</h1>
//     </div>
//   )
// }


// const newTodos = [{ id: 3, title: "get egg", body: "chicken came first", done: false }, { id: 4, title: "buy a car", body: "just because we can", done: false }];

// store.dispatch(receiveTodo({ id: 5, title: "climb the mountain", body: "again just because", done: false }))