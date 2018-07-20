class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

end
