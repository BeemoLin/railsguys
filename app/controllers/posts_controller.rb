class PostsController < ApplicationController

  #before_action :authenticate_user!, :only => [:new, :create, :update, :destroy]
  authorize_resource

  def index
    #@posts = Post.all
    @posts = @paginate = Post.paginate(:page => params[:page], :per_page => 20).order('updated_at DESC')
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params) 
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    
    @post.destroy

    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :photo)
    end

end
