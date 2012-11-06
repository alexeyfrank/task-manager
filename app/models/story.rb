class Story < ActiveRecord::Base
  attr_accessible :author_id, :description, :performer_id, :state, :title, :author, :performer

  belongs_to :author, class_name: :User
  belongs_to :performer, class_name: :User

  has_many :comments

  validates :author, presence:true
  validates :performer, presence:true
  validates :title, presence:true
  # validates :state, presence:true

  state_machine initial: :new do
    event :accept do
      transition [:new, :rejected] => :accepted
    end

    event :reject do
      transition :new => :rejected
    end

    event :start do
      transition :accepted => :started
    end

    event :finish do
      transition :started => :finished
    end
  end

end
