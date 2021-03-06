module SessionsHelper

  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns true if the given user is the current user
  def current_user?(user)
    user == current_user
  end

  # Returns the current logged-in user (if any)
  def current_user
    # if current_user is nil, assign current user via 'User.find_by', else reassign current user.
    # This technique prevents multiple unnessary queries to the database (e.g current_user method is 
    # called multiple times on a page
    # Before listing 8.36 => @current_user ||= User.find_by(id: session[:user_id])
      if (user_id = session[:user_id])
        @current_user ||= User.find_by(id: user_id)
      elsif (user_id = cookies.signed[:user_id])
       # raise # The tests still pass, so this branch is currently untested
        user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
          log_in user
          @current_user = user
        end
      end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Forgets a persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out of the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    # Had to replace with if-else. Book instructions does not seem to work.
    # Possible bug?
    if session[:forwarding_url]
      redirect_to session[:forwarding_url]
    else
      redirect_to default
    end
    # Doesn't seem to work >> redirect_to(session[:forwaring_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

end
