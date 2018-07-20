class Customer < ApplicationRecord
  has_many :rentals
  has_many :movies, through: :rentals
  validates :password, :length => { :minimum => 6}
  has_secure_password

end
