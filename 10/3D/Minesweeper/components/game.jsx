import React from 'react';
import * as Minesweeper from './minesweeper';
import Board from "./board.jsx"

export default class Game extends React.Component {
    constructor(props) {
        super(props)
        this.state = {board: new Minesweeper.Board(8,4)}
    }

    updateGame() {

    }

    render() {
      const boardState = this.state.board
      return (
        
        <Board board={boardState} update={this.updateGame.bind(this)} ></Board>
      )
    }


}