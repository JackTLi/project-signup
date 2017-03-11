class User < ActiveRecord::Base
  has_many :likes

  def self.from_omniauth(auth)
		where(auth.slice(provider: auth.provider, uid: auth.uid)).find_or_create_by(uid: auth.uid) do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.first_name = auth.info.first_name
			user.name = auth.info.name
			user.image = auth.info.image
			user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.save!
		end
  end
end
