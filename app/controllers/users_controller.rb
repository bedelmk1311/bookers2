class UsersController < ApplicationController
  def show
    @user = User.find(1) #params[:id]
    @books = @user.books
    # @userに関連付けられた投稿全てを取得、渡す 

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
