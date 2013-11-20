class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      session[:token] = @user.reset_token
      redirect_to links_url
    else
      flash.now[:errors] = @user.errors
      render :new
    end
  end

  def destroy
    session[:token] = nil
    current_user.reset_token if logged_in?
    redirect_to new_session_url
  end

end
