class Expense < ActiveRecord::Base
  attr_accessible :user_id, :date, :price, :title
  belongs_to :user
  
  validates :title, presence: true, length: { minimum: 2 }
                                                  
  validates :price, presence: true
  validates :date, presence: true
  validates :user_id, presence: true
end
