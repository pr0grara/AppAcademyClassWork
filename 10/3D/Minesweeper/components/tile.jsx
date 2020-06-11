import React from "react"

export default class Tile extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
      <label>revealed: </label>  
      <p>{this.props.mappedObj.explored.toString()}</p>
        if explored?
          is bombed?
            yes? => game over
            no? => 
              is flagged?

      {console.log(this.props.mappedObj.bombed)}
      </div>
    )
  }
}