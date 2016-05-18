class User < ActiveRecord::Base
	validates :provider, presence: true
	validates :uid, presence: true

	def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"], name: auth_hash["display_name"])
    if !user.nil?
      return user
    else
      user = User.new
      user.uid = auth_hash["uid"]
      user.provider = auth_hash["provider"]
      user.name = auth_hash["info"]["name"]
      user.save
      if user.save
        return user
      else
        return nil
      end
    end
  end

end
