class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?

  def home
    if session[:customer_id]
      @customer = Customer.find_or_create_by(id: session[:customer_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

end
