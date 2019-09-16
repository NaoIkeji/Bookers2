class BooksController < ApplicationController
	def new
		@book = Book.new
	end

	def index
		@user = current_user
		@book = Book.new
		@books = Book.all.order(created_at: :asc)
	end

	def create
		book = Book.new(book_params)
		book.user_id = current_user.id
	 	if book.save
			redirect_to books_path,notice: 'You have creatad book successfully.'
		else
			@books = Book.all.order(created_at: :asc)
			@book = Book.new
			render :index
		end
	end



	def show
		@book = Book.find(params[:id])
		@user = @book.user

	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to books_path(book.id),notice: 'You have updated book successfully.'
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
