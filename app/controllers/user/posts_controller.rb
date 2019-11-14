class User::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def my_page
    @user = User.find(params[:id])
    @posts = Post.where(user_id: current_user.id).order(created_at: "DESC")
  end

  def post_comments
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       redirect_to user_posts_path
    else
       render 'user/posts/new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    Post.find(params[:id]).destroy
    redirect_to user_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:post_image, :post_body)
  end

end
