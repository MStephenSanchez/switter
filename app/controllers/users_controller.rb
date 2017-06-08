class UsersController < ApplicationController
  skip_before_action :require_login, :only => [:register, :create]
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
    @swits = Swit.where("user_id = ?", params[:id])
    @user = User.find(params[:id])
  end

  private
    def register_params
      params.require(:register).permit(:lastname, :firstname, :middlename, :username, :password, :email, :password_confirmation)
    end

end
