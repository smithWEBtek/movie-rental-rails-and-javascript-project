DATA = {
  :customer_keys =>
    ["name", "age", "money", "password"],
  :customers => [
    ["Max Charles", 99, 50, "password"],
    ["Skai Jackson", 11, 10, "password"],
    ["Kaleo Elam", 45, 350, "password"],
    ["Megan Charpentier", 32, 2, "password"],
    ["Hayden Byerly", 17, 75, "password"],
    ["Tenzing Norgay Trainor", 18, 250, "password"],
    ["Davis Cleveland", 21, 80, "password"],
    ["Cole Sand", 16, 20, "password"],
    ["Quvenzhané Wallis", 5, 50, "password"],
    ["Baby Holly", 1, 0, "password"]
  ],
  :movie_keys =>
   ["title", "rating", "length", "lead_actor", "available", "customer_id"],
  :movies => [
    ["Raiders of the Lost Arc", "PG", 115, "Harrison Ford", true, nil],
    ["Matrix", "R", 93, "Mike Myers", true, nil],
    ["Shrek", "PG", 150, "Keanu Reeves", true, nil],
    ["Finding Nemo", "G", 101, "Albert Brooks", true, nil],
    ["Mean Girls", "PG-13", 97, "Lindsay Lohan", true, nil],
    ["Blue is the Warmest Color", "NC-17", 187, "Lea Seydoux", true, nil],
    ["Interstellar", "PG-13", 169, "Matthew McConaughey", true, nil],
    ["Toy Story", "G", 81, "Tom Hanks", true, nil],
    ["Deadpool", "R", 109, "Ryan Reynolds", true, nil],
    ["The Godfather", "R", 178, "Al Pacino", true, nil],

  ],
}

def main
  make_customers
  make_movies
end

def make_customers
  DATA[:customers].each do |customer|
    new_customer = Customer.new
    customer.each_with_index do |attribute, i|
      new_customer.send(DATA[:customer_keys][i]+"=", attribute)
    end
    new_customer.save
  end
end

def make_movies
  DATA[:movies].each do |movie|
    new_movie = Movie.new
    movie.each_with_index do |attribute, i|
      new_movie.send(DATA[:movie_keys][i] + "=", attribute)
    end
    rand(1..8).times do
      people = []
      Customer.all.each {|u| people << u }
      new_movie.customers << people[rand(0...people.length)]
    end
    new_movie.customers.each {|c| c.save}
    new_movie.save
  end
end

main
