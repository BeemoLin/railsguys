class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :update, :destroy]

  def index
    #@posts = Post.all
    @posts = @paginate = Post.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    #@post = Post.new(post_params)
    @post = current_user.posts.build(post_params) 

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :photo)
    end

end
