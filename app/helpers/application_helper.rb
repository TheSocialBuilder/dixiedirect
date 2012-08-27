module ApplicationHelper

  # Helper function to show and set just the domain name
  def current_domain
    @current_domain ||= request.domain if request.domain
  end
  
  # Helper function to show and set just the subdomain
  def current_subdomain
    @current_subdomain ||= request.subdomain if request.subdomain
  end

  # Helper function to get the current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  # Make sure we have a valid account we are dealing with on the website side
  def authenticate_subdomain!
    redirect_to root_url, alert: "The subdomain is not linked to a valid account" if current_account.nil?
  end
  
  # Check and force to make sure the user is logged in
  def authenticate_user!
    redirect_to login_path, alert: "You must be logged in to access this page" if current_user.nil?
  end
  
end