class CustomersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      session[:customer_id] = @customer.id
      redirect_to customer_path(@customer)
    else
      render :new
    end
  end

  def require_login
    redirect_to '/' unless logged_in?
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :age, :money, :password)
  end

end
