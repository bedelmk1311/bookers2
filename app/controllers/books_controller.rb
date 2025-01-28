class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def destroy
    book = Book.find(params[:id]) 
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  # 投稿データのストロングパラメータ　多分あってるはず
   private

   def book_params
     params.require(:book).permit(:title, :image, :body)
   end

end
