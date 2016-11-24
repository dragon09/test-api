class CommentsController < ApplicationController

  post '/' do
    account = Account.find_by(api_key: params[:api_key]) 
    @model = Comment.new
    @model.content  = params[:content]
    @model.account_id = account.id
    @model.post_id = params[:post_id]
    @model.save
    { :message => "You've created comment.", status: :success }.to_json
  end

  patch '/:id' do
    account = Account.find_by(api_key: params[:api_key]) 
    @model = Comment.find(params[:id])
    @model.content  = params[:content]
    @model.save
    { :message => "You've updated comment.", status: :success }.to_json
  end

  delete '/:id' do
    @model = Comment.find(params[:id])
    @model.destroy
    { :message => "You've deleted this comment.", status: :success }.to_json
  end

end
