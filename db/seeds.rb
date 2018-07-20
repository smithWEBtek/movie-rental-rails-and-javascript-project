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
   ["title", "rating", "length", "lead_actor"],
  :movies => [
    ["Raiders of the Lost Arc", "PG", 115, "Harrison Ford"],
    ["Matrix", "R", 93, "Keanu Reeves"],
    ["Shrek", "PG", 150, "Mike Myers"],
    ["Finding Nemo", "G", 101, "Albert Brooks"],
    ["Mean Girls", "PG-13", 97, "Lindsay Lohan"],
    ["Blue is the Warmest Color", "NC-17", 187, "Lea Seydoux"],
    ["Interstellar", "PG-13", 169, "Matthew McConaughey"],
    ["Toy Story", "G", 81, "Tom Hanks"],
    ["Deadpool", "R", 109, "Ryan Reynolds"],
    ["The Godfather", "R", 178, "Al Pacino"]
  ],

  :famous_quote_keys =>
   ["quote", "actor", "movie_id"],
  :famous_quotes => [
    ["Snakes. Why'd it have to be snakes?", "Harrison Ford", 1 ],
    ["Why oh why,didn't I take the blue pill?", "Joe Pantoliano", 2],
    ["Onions have layers. Ogres have layers.", "Mike Myers", 3],
    ["Just keep swimming! Just keep swimming!", "Ellen DeGeneres", 4],
    ["I'm sorry that people are so jealous of me. But I can't help it that I'm popular.", "Lacey Chabert", 5],
    ["I am happy. I'm happy with you, like this. It's my way of being happy.", "Adèle Exarchopoulos", 6],
    ["Love is the one thing that transcends time and space.", "Anne Hathaway", 7],
    ["To infinity... and beyond!", "Tim Allen", 8],
    ["I was having a nightmare. I dreamed I took Liam Neeson's daughter and he was just not having it.", "Ryan Reynolds", 9],
    ["Revenge is a dish best served cold.", "Marlon Brando", 10]
  ],

}

def main
  make_customers
  make_movies
  make_famous_quotes
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
    new_movie.save
  end
end

def make_famous_quotes
  DATA[:famous_quotes].each do |famous_quote|
    new_famous_quote = FamousQuote.new
    famous_quote.each_with_index do |attribute, i|
      new_famous_quote.send(DATA[:famous_quote_keys][i]+"=", attribute)
    end
    new_famous_quote.save
  end
end

main
