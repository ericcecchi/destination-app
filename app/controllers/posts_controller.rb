# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[create update destroy]
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts/1
  def show; end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to current_user, notice: 'Post was successfully created.'
    else
      render 'users/show'
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to current_user, notice: 'Post was successfully updated.'
    else
      render 'users/show'
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to current_user, notice: 'Post was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:content)
  end
end
