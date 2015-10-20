class User < ActiveRecord::Base

  before_save :default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :posts

  enum role: [:admin, :editor, :user]

  def default_role
    self.role ||= 2
  end
end
