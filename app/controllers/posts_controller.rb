class PostsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_post, only: %i(show edit destroy)

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.add_owner(current_user)

    if @post.save
      redirect_to @post
    else
      render :new
    end

  end

  def show
    can_current_user? :view, @post
  end

  def edit
    can_current_user? :edit, @post
  end

  def destroy
    can_current_user? :destroy, @post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
