class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_groups
  has_many :messages
  has_many :groups, through: :user_groups
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :invitations, class_name: self.to_s, as: :invited_by
  has_one_attached :photo

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

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
     user.first_name = 'first name'
     user.last_name = 'last name'
     user.save
   end
  return user
  end
  
  def self.find_for_google_oauth2(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email")
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      file = URI.open(auth.info.image)
      user.photo.attach(io: file, filename: 'unnamed.jpeg', content_type: 'image/jpeg')
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = 'first name'
      user.last_name = 'last name'
      user.save
    end
   return user
  end

  #validates 
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :first_name, :last_name, :user_name ],
    using: {
      tsearch: { prefix: true }
    }
  
  validates :first_name, :last_name, presence: true
  validates :user_name, uniqueness: true
end
