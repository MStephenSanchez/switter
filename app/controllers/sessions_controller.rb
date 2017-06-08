class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:index, :create]
  def index
      if logged_in?
        redirect_to  :swits
      end
  end

  def destroy
    log_out
    redirect_to :sessions
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password_digest])
      log_in user
      redirect_to  :swits
    else
      render :index
    end
  end

end
