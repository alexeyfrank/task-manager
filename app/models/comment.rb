class Comment < ActiveRecord::Base
	attr_accessible :author_id, :content, :story_id, :author, :story

	belongs_to :author, class_name: :User
	belongs_to :story

	validates :content, presence: true
	validates :author_id, presence: true
	validates :story_id, presence:true

end
