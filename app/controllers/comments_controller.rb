class CommentsController < ApplicationController
  def create
    comment = Comment.new(photo_id: params[:photo_id], author_id: params[:author_id], body: params[:body])
    if comment.save
      redirect_to "/photos/#{comment.photo_id}"
    else
      redirect_to "/photos/#{comment.photo_id}", alert: "Failed to add comment."
    end
  end
end
