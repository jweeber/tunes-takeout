class User < ActiveRecord::Base
	validates :provider, presence: true, 
end
