class Movie < ApplicationRecord
  has_many :rentals
  has_many :customers, through: :rentals
  has_many :famous_quotes
end
