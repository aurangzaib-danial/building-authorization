class PostsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_post, only: %i(show edit)

  def index
    @posts = Post.all
  end

  def show
    if !can_current_user? :view, @post
      redirect_to root_path, alert: 'You are not allowed to view this post'
    end
  end

  def edit
    if !can_current_user? :edit, @post
      redirect_to root_path, alert: 'You are not allowed to edit this post'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
