class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy

	has_many :post_tag
	has_many :tag, through: :post_tag
  belongs_to :user

	validates :title, presence: true
	validates :content, presence: true
end
