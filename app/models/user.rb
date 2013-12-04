class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
    attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
   
    has_many :expenses
    has_many :statuses
  
    validates :name, presence: true, 
                    uniqueness: true,
                    format: {
                        with: /^[a-zA-Z0-9_-]+$/,
                        message: 'Must be formatted correctly.'
                    }
    def gravatar_url
        stripped_email = email.strip
        downcased_email = stripped_email.downcase
        hash = Digest::MD5.hexdigest(downcased_email)        
        "http://gravatar.com/avatar/#{hash}"        
    end
  
end
