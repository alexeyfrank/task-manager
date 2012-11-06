class User < ActiveRecord::Base
	has_secure_password

	attr_accessible :email, :password, :password_confirmation

	has_many :own_stories, class_name: :Story, foreign_key: :author_id, dependent: :restrict
	has_many :assigned_stories, class_name: :Story, foreign_key: :performer_id, dependent: :restrict
	has_many :comments, foreign_key: :author_id

	validates :email,
					presence: true,
					uniqueness: true,
					email: true

	validates :password,
						presence: true,
						length: { minimum: 5 },
						confirmation: true

end
