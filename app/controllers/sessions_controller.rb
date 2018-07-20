class SessionsController < ApplicationController
  def new
    @customer = Customer.new
    @customers = Customer.all
  end

  def create
    if request.env['omniauth.auth']
      @customer = Customer.find_or_create_by(uid: auth['uid']) do |c|
        c.name = auth['info']['name']
        c.age = auth['info']['age']
      end
      session[:customer_id] = @customer.id
      render 'application/home'
    else
      @customer = Customer.find_by(id: params[:customer][:id])

      if @customer && @customer.authenticate(params[:customer][:password])
        session[:customer_id] = @customer.id
        redirect_to customer_path(@customer)
      else
        redirect_to '/login'
      end
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def destroy
    session.delete :customer_id
    redirect_to '/'
  end

end
