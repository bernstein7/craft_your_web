class UsersController < ApplicationController
  layout 'logged_out'

  before_action -> { redirect_to :root if current_user }

  def new
    registration_form = FormObjects::InitialRegistration.new
    render locals: { registration: registration_form }
  end

  def create
    registration_form = FormObjects::InitialRegistration.new(params)

    if registration_form.save
      init_session_for(registration_form.user)
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render :new, locals: { registration: registration_form }
    end
  end
end