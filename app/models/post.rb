class Post < ActiveRecord::Base
	has_many :post, dependent: :destroy

	validates :title, presence: true
	validates :content, presence: true
end
