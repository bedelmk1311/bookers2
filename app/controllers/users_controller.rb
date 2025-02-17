class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  #コントローラーで各アクションを実行する前に実行したい処理を指定することができるメソッド
  before_action :authenticate_user!


  def show
    @user = current_user
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end
