class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    
    
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def destroy
    book = Book.find(params[:id]) 
    flash[:notice] = "Book was successfully destroyed."
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(book.id) #@book?
    else
      render :edit
    end
  end
  # 投稿データのストロングパラメータ　多分あってるはず
   private

   def book_params
     params.require(:book).permit(:title, :body)
   end

end
