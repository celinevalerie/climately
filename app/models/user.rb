class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :groups, through: :users_groups
  has_many :friendships
  has_many :friends, through: :friendships
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
devise :omniauthable, omniauth_providers: [:facebook]
def self.find_for_facebook_oauth(auth)
   user_params = auth.slice("provider", "uid")
   user_params.merge! auth.info.slice("email", "first_name", "last_name")
   user_params[:facebook_picture_url] = auth.info.image
   user_params[:token] = auth.credentials.token
   user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
   user_params = user_params.to_h

   user = User.find_by(provider: auth.provider, uid: auth.uid)
   user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
   if user
     user.update(user_params)
   else
     user = User.new(user_params)
     user.password = Devise.friendly_token[0,20]  # Fake password for validation
     user.save
   end
  validates :first_name, :last_name, :user_name, :photo , :points, presence: true
  validates :user_name, uniqueness: true
end
