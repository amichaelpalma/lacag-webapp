class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "A new user was added."
      redirect_to donations_path
    else
      render 'new'
    end
  end







  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :last_name)
  end

end