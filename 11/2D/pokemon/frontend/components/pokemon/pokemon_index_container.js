import selectAllPokemon from '../../reducers/selectors'

const mapStateToProps = (state) => {
  return {
    pokemons: state.entities.pokemons,
    items: state.entities.items
  }
}