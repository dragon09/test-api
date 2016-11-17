class BlogController < ApplicationController
  get '/' do
    @model = Post.all
    @model.to_json
  end

  get '/:id' do
    @model = Post.find(params[:id])
    @model.to_json
  end

  post '/' do
    @model = Post.new
    @model.title = params[:title]
    @model.content = params[:content]
    @model.tags = params[:tags]
    @model.save
    @model.to_json
  end

  patch '/:id' do
    @model = Post.find(params[:id])
    @model.title = params[:title]
    @model.content = params[:content]
    @model.tags = params[:tags]
    @model.save
    @model.to_json
  end

  delete '/:id' do
    #binding.pry
    @model = Post.find(params[:id])
    @model.destroy
    {:message => 'Your post with an id of ' + params[:id] + ' was removed :)'}.to_json
  end
end