class BlogController < ApplicationController
  get '/' do
    @model = Post.all
    @model.to_json
  end

  get '/:id' do
    @model = Post.find(params[:id])
    @model.to_json
  end

  get '/:id/comments' do

    @model = Post.find(params[:id])
    @model.comments.to_json
  end

  post '/' do
    # binding.pry
    if account = Account.find_by(api_key: params[:api_key])
      if account.is_author == true
        @model = Post.new
        @model.title = params[:title]
        @model.content = params[:content]
        @model.account_id = account.id
        @model.tags = params[:tags]
        # @model.image = Image.new(src: params[:src])
        @model.save
        {:message => 'Post created',
        :status => :success}.to_json
      else
        {:message => 'Access restricted for non author users',
        :status => :success}.to_json
      end
    else
      {:message => 'Invalid API key',
      :status => :error}.to_json
    end

  end

  patch '/:id' do
    if account = Account.find_by(api_key: params[:api_key])
      @model = Post.find_by(id: params[:id], account_id: account.id)
      unless @model.nil?
        @model.title = params[:title] if params[:title]
        @model.content = params[:content] if params[:content]
        @model.tags = params[:tags] if params[:tags]
        @model.account_id = account.id
        @model.save
      end
      {:message => 'Post updated',
      :status => :success}.to_json
    else
      {:message => 'Invalid API key',
      :status => :error}.to_json
    end
  end

  delete '/:id' do
    if account = Account.find_by(api_key: params[:api_key])
      @model = Post.find_by(id: params[:id], account_id: account.id)
      @model.destroy unless @model.nil?
      {:message => 'Your post was removed :)'}.to_json
    else
      {:message => 'Invalid API key',
      :status => :error}.to_json
    end
  end
end
