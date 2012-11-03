class Story < ActiveRecord::Base
  attr_accessible :author_id, :description, :performer_id, :state, :title, :author, :performer

  belongs_to :author, class_name: :User
  belongs_to :performer, class_name: :User

  validates :author_id, presence:true
  validates :performer_id, presence:true
  validates :title, presence:true
  validates :state, presence:true

  state_machine initial: :new do
  	event :start do 
  		transition :new => :started
  	end

  	event :finish do 
  		transition :started => :finished
  	end

  	event :accept do 
  		transition :finished => :accepted
  	end

  	event :reject do 
  		transition :finished => :rejected
  	end

  end

end
