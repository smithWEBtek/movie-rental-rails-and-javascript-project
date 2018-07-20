class SessionsController < ApplicationController
  def new
    @customer = Customer.new
    @customers = Customer.all
  end

  

end
