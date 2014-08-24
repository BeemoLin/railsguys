class PictureController < ApplicationController
  def index
    @post = Post.find(params[:post_id])

    @pictures = @post.pictures

    respond_to do |format|
      format.html
      format.json { render json: @pictures } 
    end
  end

  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @picture }
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @picture = @post.pictures.build

    respond_to do |format|
      format.html
      format.json { render json: @picture }
    end
  end

  def edit
    @post = Post.find(params[:post_id])

    @picture = @post.pictures.find(params[:id])
  end

  def create
    @picture = Picture.new(params[:picture])

    if @picture.save
      respond_to do |format|
        format.html {
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@picture.to_jq_upload].to_json
        }
      end
    end
  end

  def update
    @post = Post.find(params[:post_id])

    @picture = @post.pictures.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to post_path(@post), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @picture = @post.pictures.find(params[:id])
    @Picture.destroy

    respond_to do |format|
      format.html { redirect_to post_pictures_url }
      format.js
    end
  end

  def make_default
    @picture = Picture.find(params[:id])
    @post = Post.find(params[:post_id])

    @post.cover = @picture.id
    @post.save

    respond_to do |format|
      format.js
    end
  end
end
