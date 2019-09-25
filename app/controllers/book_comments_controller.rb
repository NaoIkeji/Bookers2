class BookCommentsController < ApplicationController
 def create
 	book = Book.find(params[:book_id])
 	comment = current_user.book_comments.new(book_comment_params)
 	comment.book_id = book.id
 	comment.save
 	redirect_to book_path(book.id)
 end

 def edit
 	@book = Book.find(params[:book_id])
 	@comment = BookComment.find(params[:id])
 	if @comment.user_id != current_user.id
 		redirect_to book_path(@book.id)
 	end
 end

 def update
 	@book = Book.find(params[:book_id])
 	@comment = BookComment.find(params[:id])
 	if @comment.user_id != current_user.id
 		redirect_to book_path(@book.id)
 	elsif @comment.user_id == current_user.id
 		 @comment.update(book_comment_params)
 		 redirect_to book_path(@book.id)
 	else
 		render :edit
 	end
 end

 def destroy
 	book = Book.find(params[:book_id])
 	comment = BookComment.find(params[:id])
 	comment.destroy
 	redirect_to book_path(book.id)
 end

 private
 def book_comment_params
 	  params.require(:book_comment).permit(:user_id,
                                       :book_id,
                                       :comment)
 end
end
