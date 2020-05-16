# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  description :text
#  name        :string           not null
#  sex         :string(1)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    CAT_COLORS = ['white', 'brown', 'black', 'orange', 'gray']
    
    validates :color, presence: true, inclusion: { in: CAT_COLORS }
    validates :sex, presence: true, inclusion: { in: %w(M F), message: "%{value} is not a valid sex" }
    validates :birth_date, presence: true
    validates :name, presence: true

end
