class Movie < ApplicationRecord
  belongs_to :customer
  has_secure_password

end
