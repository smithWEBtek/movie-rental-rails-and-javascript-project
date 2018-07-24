class RentalsController < ApplicationController

  def index
    if params[:customer_id]
      @customer = Customer.find_by(id: params[:customer_id])
      if @customer.nil?
        redirect_to "/"
      else
        @rentals = @customer.rentals
      end
    else
      redirect_to "/"
    end
  end

  def new
    @rental = Rental.create(
          :customer_id => params[:customer_id],
          :movie_id => params[:movie_id]
        )
    @message = @rental.rent_movie
    redirect_to customer_rentals_path(@rental.customer, :message => @message)
  end

end
