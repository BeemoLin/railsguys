class PostsController < ApplicationController

  #before_action :authenticate_user!, :only => [:new, :create, :update, :destroy]
  authorize_resource

  def index
    #@posts = Post.all
    @posts = @paginate = Post.paginate(:page => params[:page], :per_page => 10).order('updated_at DESC')

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    @pictures = @post.pictures

    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def create
    #@post = Post.new(post_params)
    @post = current_user.posts.build(post_params) 

    respond_to do |format|
      if @post.save

        if params[:photos]
          params[:photos].each { |photo|
            @post.pictures.create(photo: photo)
          }
        end

        format.html { redirect_to posts_path }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    #if @post.update(post_params) 
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to post_path(@post) }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path }
      format.json { head :no_content }
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :pictures)
    end

end
