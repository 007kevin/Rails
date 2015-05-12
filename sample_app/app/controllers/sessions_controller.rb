class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user # Listing 8.34
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # flash.new is 
      # specifically designed for displaying flash messages on rendered pages
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
