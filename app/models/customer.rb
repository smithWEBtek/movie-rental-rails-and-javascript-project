class Customer < ApplicationRecord
  has_many :rentals
  has_many :movies, through: :rentals
  validates :password_digest, :length => { :minimum => 6}
  validates :name, uniqueness: true 
  validates :email, uniqueness: true
  has_secure_password

end
