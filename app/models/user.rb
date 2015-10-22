class User < ActiveRecord::Base

  before_save :default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :posts

  has_many :likes, as: :likeable
  has_many :post_likes, through: :likes, source: :post
  has_many :comment_likes, through: :likes, source: :comment

  enum role: [:admin, :editor, :basic, :guest]

  def default_role
    self.role ||= 2
  end

  def to_s
    "#{self.name} #{self.last_name}"
  end
end
