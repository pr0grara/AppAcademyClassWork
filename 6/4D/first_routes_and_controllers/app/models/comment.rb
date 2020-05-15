# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_artwork_id  (artwork_id)
#  index_comments_on_user_id     (user_id)
#
class Comment < ApplicationRecord
  validates :artwork_id, :user_id, presence: true

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

  has_many :likes, as: :likeable

  has_many :user_likes,
    through: :likes,
    source: :liker

end
