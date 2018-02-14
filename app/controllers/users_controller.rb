class UsersController < ApplicationController
  layout 'logged_out'

  before_action -> { redirect_to :root if current_user }

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      init_session_for(@user)
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render :new
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end