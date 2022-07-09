class UsersController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   @book.save
      redirect_to books_path
  end
  def index
    @users = User.all
     @user = current_user
     @books = Book.all
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  def edit
    @user = User.find(params[:id])
    if @user!= current_user
      redirect_to current_user
    end
  end
  
  def update
    @user = User.find(params[:id]) 
    @user.update(user_params)
      if @user.update(user_params)
      flash[:notice] = "Book was successfully created."
    redirect_to user_path(@user)
    else
      render "edit"
    end
  end
  
def change
  add_index :users, :name, unique: true
end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
