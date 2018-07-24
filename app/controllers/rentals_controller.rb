class RentalsController < ApplicationController

  def new
    @rental = Rental.create(
          :customer_id => params[:customer_id],
          :movie_id => params[:movie_id]
          #change status to rented/returned
        )
    @message = @rental.rent_movie
    redirect_to customer_path(@rental.customer, :message => @message)
    #change path url above
  end

end
