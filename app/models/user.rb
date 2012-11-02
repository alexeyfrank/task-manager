class User < ActiveRecord::Base
	has_secure_password
	
	attr_accessible :email, :password

	validates :email, presence: true
	validates :password, presence: true,
						length: { minimum: 5 }

	# def authenticate(password) 
	# 	return @password == password
	# end
end
