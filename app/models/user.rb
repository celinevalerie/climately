class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :groups, through: :challenges
  has_many :friendships
  has_many :friends, through: :friendships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :user_name, :photo ,:points, presence: true
  validates :user_name, uniqueness: true
end
