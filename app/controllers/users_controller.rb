class UsersController < ApplicationController
	before_action :authenticate_user!


	def new
		@user = User.new
		@book = Book.new
	end

	def create
		book = Book.new(book_params)
		book.user_id = current_user.id
		@user = current_user
	 	if book.save
			redirect_to book_path(book.id),notice: 'You have creatad book successfully.'
		else
			@books = Book.all.order(created_at: :asc)
			@book = Book.new
			render :index
		end
	end

	def index
		@user = current_user
		@users = User.all
		@book = Book.new
		@books = @user.books
	end

	def show
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new
	end

	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
			redirect_to user_path(current_user)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.id != current_user.id
			redirect_to user_path(current_user)
		elsif @user.update(user_params)
			redirect_to user_path(@user.id),notice: 'You have updated user successfully.'
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
