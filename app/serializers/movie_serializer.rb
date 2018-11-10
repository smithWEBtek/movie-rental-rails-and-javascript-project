class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :length, :lead_actor

  has_many :rentals
  has_many :customers, through: :rentals
  has_many :famous_quotes
end
