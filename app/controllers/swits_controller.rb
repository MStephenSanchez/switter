class SwitsController < ApplicationController
  def home
    @swits = Swit.all
  end

  def create
    @swit = Swit.new(swit_params.merge(:user_id => current_user.id))

    @swit.save
    @swits = Swit.all
    render 'home'
  end

  private
    def swit_params
      params.require(:swit_form).permit(:message)
    end
end
