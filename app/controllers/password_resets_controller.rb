# frozen_string_literal: true

# Controller for managing password resets
class PasswordResetsController < ApplicationController
  before_action :user,   only: %i[edit update]
  before_action :valid_user, only: %i[edit update]
  before_action :check_expiration, only: %i[edit update]

  def new; end

  def edit; end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update(user_params)
      password_reset_success
    else
      render 'edit'
    end
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = 'Email sent with password reset instructions.'
      redirect_to root_url
    else
      flash.now[:danger] = 'Email address not found.'
      render 'new'
    end
  end

  private

  def password_reset_success
    @user.expire_reset_token
    @user.forget
    reset_session
    log_in @user
    flash[:success] = 'Password has been reset.'
    redirect_to @user
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user
    @user = User.find_by(email: params[:email])
  end

  # Confirms a valid user.
  def valid_user
    unless @user&.activated? &&
           @user&.authenticated?(:reset, params[:id])

      flash[:danger] = 'Invalid email or reset token.'
      redirect_to root_url
    end
  end

  # Checks expiration of reset token.
  def check_expiration
    return unless @user.password_reset_expired?

    flash[:danger] = 'Password reset has expired.'
    redirect_to new_password_reset_url
  end
end
