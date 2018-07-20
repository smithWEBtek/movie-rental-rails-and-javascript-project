class SessionsController < ApplicationController
  def new
    @customer = Customer.new
    @customers = Customer.all
  end

  def create
    if request.env['omniauth.auth']
      @customer = Customer.find_or_create_by(email: auth['email']) do |c|
        c.name = auth['info']['name']
        c.email = auth['info']['email']
        c.password = "0"
      end

      @customer.save
      session[:customer_id] = @customer.id
      redirect_to '/'
    else
      @customer = Customer.find_by(email: params[:customer][:email])

      if @customer && @customer.authenticate(params[:customer][:password])
        session[:customer_id] = @customer.id
        redirect_to customer_path(@customer)
      else
        redirect_to '/login'
      end
    end
  end

  def destroy
    session.delete :customer_id
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
