class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  # authorize method redirects users to login page if not logged in:

  def authorize
    redirect_to root_path, alert: 'Please log in to access the page you requested.' if current_user.nil?
  end

end
