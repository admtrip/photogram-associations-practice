class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    render "photos/index"
  end

  def show
    @photo = Photo.find_by(id: params[:photo_id])
    if @photo
      render "photos/show"
    else
      redirect_to "/photos", alert: "Photo not found"
    end
  end

  def create
    @photo = Photo.new
    @photo.image = params[:photo][:image]
    @photo.caption = params[:photo][:caption]
    @photo.owner_id = params[:photo][:owner_id]

    if @photo.save
      redirect_to "/photos/#{@photo.id}"
    else
      redirect_to "/photos", alert: "Failed to create photo"
    end
  end

  def update
    @photo = Photo.find_by(id: params[:photo_id])

    if @photo
      @photo.update(image: params[:photo][:image], caption: params[:photo][:caption])
      redirect_to "/photos/#{@photo.id}"
    else
      redirect_to "/photos", alert: "Photo not found"
    end
  end

  def delete
    @photo = Photo.find_by(id: params[:photo_id])
    if @photo
      @photo.destroy
      redirect_to "/photos"
    else
      redirect_to "/photos", alert: "Photo not found"
    end
  end

  def comment
    @comment = Comment.new
    @comment.body = params[:comment][:body]
    @comment.photo_id = params[:photo_id]
    @comment.author_id = params[:comment][:author_id]
  
    if @comment.save
      redirect_to "/photos/#{@comment.photo_id}", notice: "Comment added successfully!"
    else
      redirect_to "/photos/#{params[:photo_id]}", alert: "Failed to add comment"
    end
  end 
  
end
