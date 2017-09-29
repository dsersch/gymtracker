class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    unless logged_in?
      flash[:success] = "Must be logged in for that."
      redirect_to new_session_path unless logged_in?
    end
  end

  def delete_all array
    array.each do |i|
      i.destroy
    end
  end
end
