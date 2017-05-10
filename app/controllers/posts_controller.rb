class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @lostposts = Post.where(variety: "lost")
    @foundposts = Post.where(variety: "found")

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Your post was created!"
      redirect_to posts_path
    else
      flash[:alert] = "There was a problem creating your post."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Your post has been updated."
      redirect_to posts_path
    else
      flash[:alert] = "There was a problem updating your post."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Your post was deleted."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem deleting your post."
      render :edit
    end
  end

  # strong params
  def post_params
    params.require(:post).permit(:name, :description, :date, :location, :variety, :image)
  end

end
