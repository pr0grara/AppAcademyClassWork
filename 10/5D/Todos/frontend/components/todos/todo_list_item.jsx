import React from 'react';

const ToDoListItem = (props) => {
  
    return(
        <>
        <li> {props.todo} </li>
        {/* <li> {props.todos.body} </li> */}
        </>

    )
};

export default ToDoListItem;