class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as #{user.username}."
      redirect_to root_path
    else
      flash[:danger] = "Email/Password combination is incorrect. Try again or contact your admin."
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:success] = "Successfully logged out."
    redirect_to root_path
  end

end