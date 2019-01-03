class RentalSerializer < ActiveModel::Serializer
	attributes :id, :status
	
	belongs_to :movie
  belongs_to :customer
end
