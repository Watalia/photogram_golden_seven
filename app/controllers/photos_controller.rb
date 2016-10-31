class PhotosController < ApplicationController
  # params={"source"=>"http://upload.wikimedia.org/wikipedia/commons/thumb/something_Else", "caption"=>"2"}
  def index
    @list_of_photos = (Photo.all)
      render("index.html.erb")
  end

  def show
    @photo = Photo.find_by({:id=>params[:id]})
    @photo_source = @photo.source
    @photo_caption = @photo.caption
    @photo_id = @photo.id
  end

  def new_form
    render("new_form.html.erb")
  end

# Im able to add a new picture
  def create_row
    p = Photo.new
    p.caption = params[:the_caption]
    p.source = params[:the_source]
    p.save
    # render("create_row.html.erb")
    redirect_to("http://localhost:3000")
  end

end
