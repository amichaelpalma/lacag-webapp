class UsersController < ApplicationController

  before_action :authorize, only: [ :index, :new, :edit, :show, :update, :destroy, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "A new user was added."
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User successfully updated"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User successfully deleted"
    redirect_to users_path
  end







  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
  end

end