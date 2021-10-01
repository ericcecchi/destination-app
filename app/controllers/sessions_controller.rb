# frozen_string_literal: true

# Controller for managing user session
class SessionsController < ApplicationController
  def new; end

  # rubocop:todo Metrics/MethodLength, Metrics/AbcSize
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      forwarding_url = session[:forwarding_url]
      reset_session
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      log_in @user
      redirect_to forwarding_url || @user
    else
      flash.now[:danger] = 'Invalid email or password.'
      render 'new'
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
