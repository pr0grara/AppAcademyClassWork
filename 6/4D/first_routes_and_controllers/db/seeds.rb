# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
  andrew = User.create!(username: 'Andrew')
  ara = User.create!(username: 'Ara')
  joe = User.create!(username: 'Joe')

Artwork.destroy_all
  raft = Artwork.create!(image_url: 'image_url_here', title: 'Raft of the Medusa', artist_id: ara.id)
  mona = Artwork.create!(image_url: 'image_url_here1', title: 'Mona Lisa', artist_id: andrew.id)

ArtworkShare.destroy_all
  raft_to_joe = ArtworkShare.create!(artwork_id: raft.id, viewer_id: joe.id)
  mona_to_ara = ArtworkShare.create!(artwork_id: mona.id, viewer_id: ara.id)