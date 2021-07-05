class User < ApplicationRecord
  has_many :posts, dependent: :delete_all

  def self.find_or_create_account(hash)
    provider = hash[:provider]
    uid = hash[:uid]
    name = hash[:info][:name]
    image = hash[:info][:image]

    User.find_or_create_by!(provider: provider, uid: uid) do |user|
      user.name = name
      user.avatar = image
    end
  end
end
