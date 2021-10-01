# frozen_string_literal: true

# Controller for managing account activations
class AccountActivationsController < ApplicationController
  before_action :logged_in?, only: [:create]

  def create
    current_user.send_activation_email
    flash[:info] = 'Please check your email to activate your account.'
    redirect_to edit_user_path(current_user)
  end

  # rubocop:todo Metrics/AbcSize
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user unless logged_in?
      flash[:success] = 'Your account has been activated.'
      redirect_to user
    else
      flash[:danger] = 'Invalid activation link.'
      redirect_to root_url
    end
  end
  # rubocop:enable Metrics/AbcSize
end
