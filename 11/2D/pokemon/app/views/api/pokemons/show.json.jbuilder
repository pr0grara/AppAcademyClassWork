
json.pokemon do 
  json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type, :moves, :image_url, :item_ids
  json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
end

json.items do
  @pokemon.items.each do |ele|
    json.set! ele.id do
      json.extract! ele, :id, :name, :pokemon_id, :price, :happiness, :image_url
      json.image_url asset_path("#{ele.image_url}")
    end
  end
end
