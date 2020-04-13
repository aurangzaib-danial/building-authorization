class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_post

  def new
    @users = User.not_associated_with(@post)
  end

  def create
    user_id, permission = params[:user_id], params[:permission]
    
    if user_id.present? && permission.present?
      @post.shared_posts.create(user_id: user_id, permission: permission)

      redirect_to permissions_post_path(@post)       
    else
      redirect_to new_post_user_path(@post), alert: 'There was error'
    end
  end

  private

  def authorize_post
    @post = Post.find(params[:post_id])
    authorize! :manage, @post
  end
end
