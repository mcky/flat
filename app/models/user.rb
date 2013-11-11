class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  validates :name, presence: true,
                    uniqueness: true,
                    format: {
                      with: /\A[a-zA-Z\-\_]+\Z/,
                      message: "must be formatted correctly."
                    }
  
  has_many :expenses
  
end
