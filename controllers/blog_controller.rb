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
    # if is_api_key_valid?(params[:api_key])
      @model.password = params[:password]
      @model.generate[:api_key]
      @model.api_key = params[:api_key]
      binding.pry
      p 'it works: ' + params[:api_key]
      @model = Post.new
      @model.title = params[:title]
      @model.content = params[:content]
      @model.tags = params[:tags]
      @model.image = Image.new(src: params[:src])
      @model.save
      @model.to_json
    # else
    #   binding.pry
    #   p 'api key is not valid'
    #   {:message => 'Invalid API key',
    #   :status => 403}.to_json
    # end

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
