class UsersController < ApplicationController

  def register
    if logged_in?
      redirect_to  action: 'index', controller: 'sessions'
    end
  end

  def create
    @user = User.new(register_params)

    @user.save
    redirect_to @user
  end

  def show
    redirect_to  action: 'index', controller: 'sessions' #change this to redirect to auto login
  end

  private
    def register_params
      params.require(:register).permit(:lastname, :firstname, :middlename, :username, :password, :email, :password_confirmation)
    end

end
