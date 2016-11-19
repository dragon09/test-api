class AccountController < ApplicationController
  get '/' do
    @model = Account.all
    @model.to_json
  end

  get '/:id' do
    @model = Account.find(params[:id])
    @model.to_json
  end

  post '/' do
    @model = Account.new
    @model.name = params[:name]
    @model.email = params[:email]
    @model.password = params[:password]
    @model.save
    @model.to_json
  end

  patch '/:id' do
    @model = Account.find(params[:id])
    @model.name = params[:name]
    @model.email = params[:email]
    @model.password = params[:password]
    @model.save
    @model.to_json
  end

  delete '/:id' do
    #binding.pry
    @model = Account.find(params[:id])
    @model.destroy
    {:message => 'Your account of' + params[:id] + ' has been created :)'}.to_json
  end
end
