class UsersController < ApplicationController
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
    @user = User.new(params[:user])
    @user.update_attributes
    redirect_to user_url(@user)
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
