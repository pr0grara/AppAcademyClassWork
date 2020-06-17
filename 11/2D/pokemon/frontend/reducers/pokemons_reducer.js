import {
  RECEIVE_ALL_POKEMON, 
  RECEIVE_SINGLE_POKES
} from '../actions/pokemon_actions'

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state)
  const nextState = Object.assign({}, state)
  //let poke

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return Object.assign(nextState, action.pokemon);
    default:
      return state;
  }
}

export default pokemonReducer;