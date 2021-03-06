class SessionsController < ApplicationController

  skip_before_filter :logged_in?, only: [:create,:new]


  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      session[:token] = @user.reset_token
      redirect_to links_url
    else
      flash[:errors] = "Invalid Login1"
      redirect_to new_session_url
    end
  end

  def destroy
    #fail
    current_user.reset_token
    session[:token] = nil
    redirect_to new_session_url
  end

end
