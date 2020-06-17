export const fetchAllPokemon = () => {
  return $.ajax({
    method: 'get',
    url: '/api/pokemons'
  })
};

