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
    @user.update(user_params)
    redirect_to user_path(@user.id)  
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
