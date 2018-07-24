class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :customer

  def rent_movie
    if self.customer != nil
      if !old_enough?
        "Sorry, you are not old enough to watch this movie."
      else
        self.update(:status => "checked out",)
        "Thanks for renting #{self.movie.title}!"
      end
    end
  end

  def old_enough?
    rental_rating = self.movie.rating
    if rental_rating == "NC-17"
      required_age = 18
    elsif rental_rating == "R"
      required_age = 17
    elsif rental_rating == "PG-13" || rental_rating == "PG"
      required_age = 13
    elsif rental_rating == "G"
      required_age = 0
    end
    required_age < self.customer.age
  end

end
