class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def show
  end

  def index
  end

  def edit
  end
  
   # 投稿データのストロングパラメータ
   # 未編集 とりあえずで
   private

   def book_params
     params.require(:book).permit(:title, :image, :body)
   end

end
