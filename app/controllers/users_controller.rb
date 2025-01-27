class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
     # データ（レコード）を1件取得
    @books = @user.books
    #特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得,@post_imagesに渡す 

  end

  def edit
    #@book = Book.new
    #@books = Book.all
  end

end
