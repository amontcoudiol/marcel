class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [ :facebook ]
  has_many :votes
  has_many :campaigns, dependent: :destroy

  def self.find_for_facebook_oauth(auth)
    user = self.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.birthday = auth.extra.raw_info.birthday
      user.gender = auth.extra.raw_info.gender
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end

    if user and user.confirmed?
      user.update_attribute('fb_access_token', access_token)
      user
    end
  end


end
