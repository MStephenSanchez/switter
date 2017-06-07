class SwitsController < ApplicationController
  def home
    @swits = Swit.joins(:user).select('swits.*,users.username')
  end

  def create
    @swit = Swit.new(swit_params.merge(:user_id => current_user.id))

    @swit.save
    @swits = Swit.joins(:user).select('swits.*,users.username,users.id as user_id')
    render 'home'
  end

  private
    def swit_params
      params.require(:swit_form).permit(:message)
    end
end
