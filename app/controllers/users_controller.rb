class UsersController < ApplicationController
 def show
  @users = User.find(params[:id])
  @book = Book.new
  @books = @users.books
  # @books = @user.books.page(params[:page]).reverse_order
 end
 def create
  @user = User.new
 end
 def index
  @users = User.all
  @user = current_user
  @book = Book.new
 end
 def edit
  @user = User.find(params[:id])
  if current_user != @user
    redirect_to user_path(current_user)
  end
 end
 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:update] = "You have updated user successfully."
    @user.save
    redirect_to user_path(@user)
  else
    flash[:update] = "error"
    render :edit
  end
 end

 private


 def user_params
  params.require(:user).permit(:profile_image, :name, :introduction)
 end
end
