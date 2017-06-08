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
    if user && user.authenticate(params[:session][:password_digest])
      log_in user
      redirect_to  action: 'home', controller: 'swits'
    else
      render 'index'
    end
  end

end
