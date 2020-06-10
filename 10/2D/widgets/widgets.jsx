
import React from "react";
import ReactDOM from "react-dom";
import Clock from "./frontend/clock.jsx";
import Tabs from "./frontend/tabs.jsx";


document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main");
  ReactDOM.render(<Root/>, main)
})

const panes = [
  { title: 'one', content: 'I am the first' },
  { title: 'two', content: 'Second pane here' },
  { title: 'three', content: 'Third pane here' }
];

const Root = () => {
  return (
    <>
      <div className="clock">
        <Clock/>
      </div>
      <div className="tabs">
        <Tabs panes={panes}/>
      </div>
    </>
  );
}