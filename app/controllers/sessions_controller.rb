class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:index, :create]
  def index
      if logged_in?
        redirect_to  action: 'home', controller: 'swits'
      end
  end

  def destroy
    log_out
    redirect_to action: 'index', controller: 'sessions'
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to  action: 'home', controller: 'swits'
    else
      # Create an error message.
      render 'index'
    end
  end

end
