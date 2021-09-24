# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update show destroy]
  before_action :activated_user, only: %i[index destroy]
  before_action :correct_user,   only: %i[edit update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @recommendations = @user.recommendations.paginate(page: params[:page])
    activated_user unless current_user?(@user) || current_user.activated?
    @recommendation = current_user.recommendations.build if current_user?(@user) && current_user.activated?
    redirect_to root_url unless @user.activated? || current_user?(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      reset_session
      log_in @user
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Settings saved.'
      redirect_to edit_user_path @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
