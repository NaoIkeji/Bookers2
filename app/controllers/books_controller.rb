class BooksController < ApplicationController
	before_action :authenticate_user!

	def new
		@book = Book.new
	end

	def index
		@user = current_user
		@book = Book.new
		@books = Book.all.order(created_at: :asc)
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@user = current_user
	 	if @book.save
			redirect_to book_path(@book.id),notice: 'You have creatad book successfully.'
		else
			@books = Book.all.order(created_at: :asc)
			render :index
		end
	end


	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@bookn = Book.new
		@book_comment = BookComment.new
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		end

	end

	def update
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		elsif @book.update(book_params)
			redirect_to book_path(@book.id),notice: 'You have updated book successfully.'
		else
			#@book = Book.new(book_params)
			render :edit
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

end
