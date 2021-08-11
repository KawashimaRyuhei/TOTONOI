class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
      
    with_options length: { minimum: 6 },
      format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/,
               message: 'Please include both letters and numbers in your settings' } do
      validates :encrypted_password
      validates :password
      validates :password_confirmation
    end
  end  
end
