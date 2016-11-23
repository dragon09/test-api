class SessionsController < ApplicationController
  enable :session

  get '/account' do
    @model = Account.all
    @model.to_json

  end

  get '/:id' do
    @model = Account.find(params[:id])
    @model.to_json
  end


  post '/login' do
    @account = Account.find_by email: params[:email]

    if @account && @account.authenticate(params[:password])
      session[:logged_in] = true
      session[:name] = @account.name
      session[:register] = false
      @account.to_json
    else
      # "You entered wrong username or password, please try again!"
      {status: :error}.to_json
    end
 end


 get '/login' do
      session[:logged_in] = true
end


end
