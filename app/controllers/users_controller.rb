class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post

  def new
    if can_current_user? :manage, @post
      @users = User.not_associated_with(@post)
    end
  end

  def create
    if can_current_user? :manage, @post
      user_id, permission = params[:user_id], params[:permission]
      
      if user_id.present? && permission.present?
        @post.shared_posts.create(user_id: user_id, permission: permission)

        redirect_to permissions_post_path(@post)       
      else
        redirect_to new_post_user_path(@post), alert: 'There was error'
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
