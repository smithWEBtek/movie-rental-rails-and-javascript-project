class Customer < ApplicationRecord
  has_many :rentals
  has_many :movies, through: :rentals

  has_secure_password

end
