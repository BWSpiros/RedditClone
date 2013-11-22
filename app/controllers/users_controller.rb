class UsersController < ApplicationController


  skip_before_filter :logged_in?, only: [:create,:new,:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to links_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user = User.find_by_password_reset_token(params[:password_reset_token]) unless @user

    if @user && !@user.password_reset_token.nil?
      fail

      @user.password_reset_token = nil
      @user.password = params[:password]
      @user.save
      redirect_to new_session_url

    elsif @user
      fail
      @user.update_attributes(params[:user])
      redirect_to root_url

    else
      flash[:error] = "Fuck off"
      redirect_to new_session_url
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def delete
  end

end
