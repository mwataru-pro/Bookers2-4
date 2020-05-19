class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :guard, only: [:edit]

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

private

  def guard
    user = User.find(params[:id])
    if user != current_user
      redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image ,:introduction)
  end

end
