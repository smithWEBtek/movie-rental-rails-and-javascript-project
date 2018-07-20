class SessionsController < ApplicationController
  def new
    @customer = Customer.new
    @customers = Customer.all
  end

  def create
    @customer = Customer.find_by(id: params[:customer][:id])

    if @customer && @customer.authenticate(params[:customer][:password])
      session[:customer_id] = @customer.id
      redirect_to customer_path(@customer)
    else
      redirect_to '/login'
    end
  end
  
  def destroy
    session.delete :customer_id
    redirect_to '/'
  end

end
