class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    validate :validate_username

    def validate_username
        if User.where(email: username).exists?
            errors.add(:username, :invalid)
        end
    end
end
