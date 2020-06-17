
const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemons)
}

export default selectAllPokemon
