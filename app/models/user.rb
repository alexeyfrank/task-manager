class User < ActiveRecord::Base
	has_secure_password
	
	attr_accessible :email, :password, :password_confirmation

	has_many :own_stories, class_name: :Story, foreign_key: :author_id
	has_many :assigned_stories, class_name: :Story, foreign_key: :performer_id 

	validates :email, presence: true,
					  uniqueness: true,
                      format: { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

	validates :password, presence: true,
						length: { minimum: 5 },
						confirmation: true
						
end
