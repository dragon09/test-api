class AccountsController < ApplicationController

  @username = ''

  get '/' do
    Account.all.to_json
  end

  # get '/:id' do
  #   @model = Account.find(params[:id])
  #   @model.to_json
  # end

  post '/login' do
    @account = Account.find_by email: params[:email]
    @email = params[:email]
    if @account && @account.authenticate(params[:password]) == true
      @account_message = "You have successfully logged in."
      session[:logged_in] = true
      session[:name] = @account.name
      session[:register] = false
      @account.to_json
        # "You entered wrong username or password, please try again!"
    else @account && @account.authenticate(params[:password]) == false
        @account_message = "You have entered the wrong email address or password."
      {status: :error}.to_json
    end
  end

  post '/' do
    puts params
    @name = params[:name]
    @email = params[:email]
    @password = params[:password]
    if @name == true
      # session[:logged_in] = true
      # session[:user_id]    = @user.id
      # session[:name] = params[:name]
      # session[:register] = true
      @model = Account.new
      @model.name = @name
      @model.email = @email
      @model.password = params[:password]
      @model.password_confirmation = params[:password]
      @model.api_key = 'catsmeow'
      @model.save
      @account_message = "You are now logged in and registered!"
end
      #binding.pry
      @model = Account.where(:name => @name).first!
        if @model.password_digest == BCrypt::Engine.hash_secret(@password, @model.password)
          @account_message = "Hello, welcome back!"

      # session[:name] = @model
      # @model = session[:user][:name]
      @model.to_json
      # this code never runs
    else
      "You did not sign up in correctly"
    end
    # get '/logout' do
    # 		session[:name] = nil
    # 		@name = nil
    # 		redirect '/'
    # 	end
  end
end
