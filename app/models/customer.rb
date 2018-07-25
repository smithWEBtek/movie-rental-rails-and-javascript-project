class Customer < ApplicationRecord
  has_many :rentals
  has_many :movies, through: :rentals
  validates :password_digest, :length => { :minimum => 6}
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :age, presence: true, numericality: true
  has_secure_password

end
