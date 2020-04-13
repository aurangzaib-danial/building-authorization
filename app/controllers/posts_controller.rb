class PostsController < ApplicationController
  
  before_action :authenticate_user!
  load_and_authorize_resource except: %i[index new create]

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
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def permissions

  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
