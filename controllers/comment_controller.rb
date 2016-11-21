class CommentsController < ApplicationController

  get '/' do
    Comment.all.to_json

  end

  get '/:id' do
    @id = params[:id]
    Comment.find(@id).to_json

  end




  post '/' do
    @model = Comment.new
    @model.comment  = params[:comment]
    @model.user_id = params[:user_id]
    @model.post_id = params[:post_id]
    @model.image_id = params[image_id]
    @model.foreign_key  = params[:foreign_key]
    @model.save
    @model.to_json
  end

  patch '/:id' do

    @id = params[:id]

    @comment  = params[:comment]
    @model.user_id = params[:user_id]
    @model.post_id = params[:post_id]
    @model.image_id = params[image_id]
    @foreign_key= params[:foreign_key]

    @new_row = Comment.find(@id)
    @new_row.comment  = @comment
    @model.user_id = params[:user_id]
    @model.post_id = params[:post_id]
    @model.image_id = params[image_id]
    @new_row.foreign_key  = @foreign_key

    @new_row.save
    @new_row.to_json
  end

  delete '/:id' do
    @id = params[:id]
    @model = Comment.find(@id)
    @model.destroy
    "You've deleted this comment."
  end

end
