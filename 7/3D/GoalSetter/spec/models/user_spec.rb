# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  session_token   :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_session_token  (session_token) UNIQUE
#  index_users_on_username       (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:session_token)}
  it {should validate_presence_of(:password_digest)}

  it {should validate_uniqueness_of(:username)}
  it {should validate_uniqueness_of(:session_token)}
  subject(:joe) {User.create(
    username: "joe",
    password: "123"
  )}
  
  
end
