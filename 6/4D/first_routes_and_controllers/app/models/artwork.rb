# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  image_url :text             not null
#  title     :string           not null
#  artist_id :integer          not null
#
# Indexes
#
#  index_artworks_on_artist_id_and_title  (artist_id,title) UNIQUE
#
class Artwork < ApplicationRecord
  validates :title, :image_url, presence: true
  validates :title, uniqueness: { scope: :artist_id }
  
    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User 

    has_many :artwork_shares,
      foreign_key: :artwork_id,
      class_name: :ArtworkShare

    has_many :shared_viewers,
      through: :artwork_shares,
      source: :viewer

    has_many :comments, dependent: :destroy,
      foreign_key: :artwork_id,
      class_name: :Comment

    has_many :likes, as: :likeable

    has_many :user_likes,
      through: :likes,
      source: :liker
end

# validates :user, uniqueness: { scope: :article }
