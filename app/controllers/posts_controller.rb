class PostsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_post, except: %i(index new create)

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

  def update

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
