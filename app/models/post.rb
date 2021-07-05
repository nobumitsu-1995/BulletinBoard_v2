class Post < ApplicationRecord
  belongs_to :user, optional: true
  validates :content, length: { maximum: 200 }, presence: true

end
