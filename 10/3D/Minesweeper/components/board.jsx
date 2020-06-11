import React from "react"
import Tile from "./tile.jsx"

export default class Board extends React.Component {
  constructor(props) {
    super(props)
  }

  //[[t1, t2, t3, t4, t5, t6, t7, t8], [], [], [], [], [], [], []]

  render() {
    return (
      <div>
        {this.props.board.grid.map((row, idx1) => {
          return row.map((tile, idx2) => {
            return <div key={[idx1, idx2]}><Tile mappedObj={tile} func={
              this.props.update}></Tile></div>
            //return <Tile mappedObj={tile} func={this.props.update}></Tile>
          })
        })}
      </div>
    );
  }
}