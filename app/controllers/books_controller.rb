class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    
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
    @user = current_user #_list用　view側でcurrent_userでも可
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book) 
    else
      render :edit
    end
  end

   private

   def book_params
     params.require(:book).permit(:title, :body)
   end

end
