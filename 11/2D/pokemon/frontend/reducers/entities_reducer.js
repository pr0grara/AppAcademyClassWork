import {combineReducers} from "redux"
import pokemons from './pokemons_reducer'
import items from './items_reducer'


export default combineReducers({ 
  items, pokemons
})