class ApplicationController < ActionController::Base
  include SessionsHelper

  # Confirms a logged-in user.
  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = 'You must log in to access that page.'
    redirect_to login_url
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def activated_user
    return if user_activated?

    flash[:danger] = 'You must activate your account to use this feature.'
    redirect_to root_url
  end
end
