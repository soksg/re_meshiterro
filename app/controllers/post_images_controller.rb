class PostImagesController < ApplicationController
  def new
    @post_image=PostImage.new
  end

  def create
    # @post_image=PostImage.new(post_image_params)
    # @post_image.user==current_user.id
    @post_image=current_user.post_images.new(post_image_params)
    if @post_image.save
      redirect_to post_images_path
    else
      render_to request.referer
    end
  end

  def index
    @post_images=PostImage.all
  end

  def show
    @post_image=PostImage.find(params[:id])
    @post_comment=PostComment.new
  end

  def destroy
    @post_image=PostImage.find(params[:id]).destroy
    redirect_to post_images_path
  end

  private
    def post_image_params
      params.require(:post_image).permit(:shop_name, :caption, :image)
    end
end
