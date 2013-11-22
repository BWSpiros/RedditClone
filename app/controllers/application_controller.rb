class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :logged_in?

  def logged_in?
    redirect_to new_session_url unless current_user
  end
end
