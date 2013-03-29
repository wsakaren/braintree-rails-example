class UsersController < ApplicationController
  before_filter :find_user, :except => [:index, :new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit; end

  def show; end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      flash[:alert] = @user.errors.full_messages.join(".\n")
      render action: "new"
    end
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      flash[:alert] = @user.errors.full_messages.join(".\n")
      render action: "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
end
