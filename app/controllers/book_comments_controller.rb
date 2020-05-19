class BookCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@book = Book.find(params[:book_id])
		@book_comment = current_user.book_comments.new(book_comment_params)
		# コメントをしている本のIDが、本のIDと一緒だったら
		@book_comment.book_id = @book.id
		# コメントを保存
		@book_comment.save
		# 同じページに戻る
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@book_comment = BookComment.find(params[:book_id])
		# コメントを削除
		@book_comment.destroy
		#同じページに戻る
		redirect_back(fallback_location: root_path)
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
