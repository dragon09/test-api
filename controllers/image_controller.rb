class ImagesController < ApplicationController

  get '/' do
    Image.all.to_json

  end

  get '/:id' do
    @id = params[:id]
    Image.find(@id).to_json

  end




  post '/' do
    @model = Image.new
    @model.image  = params[:image]
    @model.user_id = params[:user_id]
    @model.caption = params[:caption]
    @model.src = params[:src]
    @model.foreign_key  = params[:foreign_key]
    @model.save
    @model.to_json
  end

  patch '/:id' do

    @id = params[:id]

    @image  = params[:image]
    @model.user_id = params[:user_id]
    @model.caption = params[:caption]
    @model.src = params[:src]
    @foreign_key= params[:foreign_key]

    @new_row = Image.find(@id)
    @new_row.image  = @comment
    @model.user_id = params[:user_id]
    @model.caption = params[:caption]
    @model.src = params[:src]
    @new_row.foreign_key  = @foreign_key

    @new_row.save
    @new_row.to_json
  end

  delete '/:id' do
    @id = params[:id]
    @model = Image.find(@id)
    @model.destroy
    "You've deleted this image."
  end

end
