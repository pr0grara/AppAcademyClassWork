# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#
# Indexes
#
#  index_artwork_shares_on_artwork_id_and_viewer_id  (artwork_id,viewer_id) UNIQUE
#  index_artwork_shares_on_viewer_id                 (viewer_id)
#
class ArtworkShare < ApplicationRecord
  validates :viewer_id, uniqueness: { scope: :artwork_id }
# validates :user, uniqueness: { scope: :article }


  belongs_to :viewer, #dependent: :destroy, how to do this??
    foreign_key: :viewer_id,
    class_name: :User

  belongs_to :artwork, #dependent: :destroy,
    foreign_key: :artwork_id,
    class_name: :Artwork
end
