class Status < ActiveRecord::Base
  attr_accessible :user_id, :body
  belongs_to :user
  
  validates :body, presence: true, length: { minimum: 2 }
                                                  
  validates :user_id, presence: true
end
