class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy

	has_many :post_tag
	has_many :tag, through: :post_tag

  belongs_to :user

  has_many :likes, as: :likeable
  has_many :user_likes, through: :likes, source: :user

	validates :title, presence: true
	validates :content, presence: true

  def remove_like user
    self.likes.where(user: user).first.delete
  end

  def liked_by?(user)
    self.user_likes.include? user
  end

end
