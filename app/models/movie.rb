class Movie < ApplicationRecord
  has_many :rentals
  has_many :customers, through: :rentals
  has_many :famous_quotes

  def self.rating_filter(rating_param)
    if rating_param == "G"
      Movie.where("rating = 'G'")
    elsif rating_param == "PG"
      Movie.where("rating = 'PG'")
    elsif rating_param == "PG-13"
      Movie.where("rating = 'PG-13'")
    elsif rating_param == "R"
      Movie.where("rating = 'R'")
    elsif rating_param == "NC-17"
      Movie.where("rating = 'NC-17'")
    end
  end

end
