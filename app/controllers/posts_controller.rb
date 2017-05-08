class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Your post was created!"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem creating your post."
      render :new
    end
  end


  # strong params
  def post_params
    params.require(:post).permit(:name, :description, :date, :location, :variety, :photo)

  end
end
