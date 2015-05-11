module SessionsHelper

  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any)
  def current_user
    # if current_user is nil, assign current user via 'User.find_by', else reassign current user.
    # This technique prevents multiple unnessary queries to the database (e.g current_user method is 
    # called multiple times on a page
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

end
