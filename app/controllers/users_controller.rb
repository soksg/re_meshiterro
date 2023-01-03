class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @post_images=@user.post_images
  end

  def edit
  end

  private
  def user_params
    params.require(user).permit(:name, :email, :image)
  end
end
