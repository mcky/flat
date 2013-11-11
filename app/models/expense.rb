class Expense < ActiveRecord::Base
  attr_accessible :user_id, :date, :price, :title
  belongs_to :user
end
