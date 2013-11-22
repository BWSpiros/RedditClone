class PasswordResetsController < ApplicationController


  skip_before_filter :logged_in?
  def new
  end

  def edit
    @user = User.find_by_password_reset_token(params[:password_reset_token])
    if @user
      @user.password_reset_token = params[:password_reset_token]
      # send email
    else
      flash[:error] = "Fuck off"
      redirect_to new_session_url
    end

  end

  def create
    @user = User.find_by_email(params[:email])
    if @user

      @user.send_password_reset_token
    end
    flash[:notice] = "Email Sent"

    redirect_to new_session_url
  end



end
