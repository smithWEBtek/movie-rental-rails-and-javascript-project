class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end
  
end
