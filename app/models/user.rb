class User
	include ActiveModel::Validations

	attr_reader :provider, :uid, :name
	
	validates :provider, presence: true
	validates :uid, presence: true
end
