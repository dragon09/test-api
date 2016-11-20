class AccountsController < ApplicationController
  enable :sessions
  @username = ''

  get '/' do
#account/user_register
  end

  # get '/:id' do
  #   @model = Account.find(params[:id])
  #   @model.to_json
  # end

  post '/register' do
    puts params
    @username = params[:username]
    @email = params[:email]
    @password = params[:password]
    if @username == true
      session[:logged_in] = true
      session[:user_id]    = @user.id
      session[:name] = params[:name]
      session[:register] = true

      redirect '/account/account_user'
    else
      "You did not sign up in correctly"
    end

    password_salt = BCrypt::Engine.generate_salt
    password_hash = BCrypt::Engine.hash_secret(@password, password_salt)

    @model = Account.new
    @model.username = @username
    @model.email = @email
    @model.password = password_hash
    @model.password_salt = password_salt
    @model.save
    @account_message = "You are now logged in and registered!"

    session[:user] = @model
    @username = session[:user][:username]
    @model.to_json
  end

end
