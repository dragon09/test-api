class SessionsController < ApplicationController
  enable :session

  get '/account' do
    @model = Account.all
    @model.to_json
     ejs :account_user
  end

  get '/:id' do
    @model = Account.find(params[:id])
    @model.to_json
  end


  post '/login' do
    @user = Account.find_by email: params[:email]
    if @user && ( @user.password == BCrypt::Engine.hash_secret(params[:password], @user.password_salt))
      session[:logged_in] = true
      session[:name] = @user.name
      session[:register] = false
      @user.to_json
    else
      # "You entered wrong username or password, please try again!"
      {status: :error}.to_json
    end
 end

 get '/logout' do
   session = nil
   erb :logout
 end

end
