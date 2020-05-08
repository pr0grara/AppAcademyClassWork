# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#
class ShortenedUrl < ApplicationRecord
    validates :long_url, :short_url, :user_id, presence: true
    validates :short_url, uniqueness: true

    def self.random_code
        code = SecureRandom.urlsafe_base64
        return code unless ShortenedUrl.exists?(short_url: code)
        while code ShortenedUrl.exists?(short_url: code)
            code = SecureRandom.urlsafe_base64
        end
        code
    end

    def self.create!(user, long) #we need to save this instance into the database otherwise we dont get any useful functionality from it
        instance = ShortenedUrl.new({long_url: long, short_url: ShortenedUrl.random_code, user_id: user.id})
        instance.save #lowtech solution, the .create! method both instantiates and saves an object, just learned this in flex
    end
end
