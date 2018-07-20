class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def home
    if session[:current_id]
      @current = Current.find_or_create_by(id: session[:current_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

end
