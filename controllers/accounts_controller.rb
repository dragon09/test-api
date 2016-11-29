class AccountsController < ApplicationController

  @username = ''
  # GET	/             accounts#index	display a list of all photos
  # POST /	        accounts#create	create a new photo
  # GET	/:id	       accounts#show	display a specific photo
  # PATCH/PUT	/:id	       accounts#update	update a specific photo
  # DELETE	/:id	        accounts#destroy	delete a specific photo

  get '/' do
    Account.all.map{|account| {email: account.email, name: account.name} }.to_json
  end

  # get '/:id' do
  #   @model = Account.find(params[:id])
  #   @model.to_json
  # end

  # post '/' do
  #   @account = Account.find_by email: params[:email]
  #   @email = params[:email]
  #   if @account && @account.authenticate(params[:password]) == true
  #     @account_message = "You have successfully logged in."
  #
  #   else @account && @account.authenticate(params[:password]) == false
  #     @account_message = "You have entered the wrong email address or password."
  #     {status: :error}.to_json
  #   end
  # end
  #
  #   @model.api_key = 'catsmeow'
  #   @model.save
  #   @account_message = "You are now logged in and registered!"
  # end

    # @model = Account.where(:name => @name).first!
    #   if @model.password_digest = BCrypt::Engine.hash_secret(@password,
    # @model.password)
    # { message: "You are now logged in and registered!",
    #       status: :success,
    #       api_key: @model.api_key,
    #       email: @model.email
    # }.to_json
    #   @account_message = "Hello, welcome back!"

    # else
    #   { message: "Account with this email already exists!",
    #   status: :error,
    #   email: @model.email
    #   }.to_json
    # end

  post '/' do
    # puts params
    @name = params[:name]
    @email = params[:email]
    @password = params[:password]
    @model = Account.find_by(email: @email)

    if @model.nil?
      @model = Account.new
      @model.name = @name
      @model.email = @email
      @model.password = params[:password]
      @model.password_confirmation = params[:password]
      @model.is_author = params[:is_author]
      @model.api_key = key = 30.times.map{('a'..'z').to_a.sample}.join
      @model.save
      { message: "You are now logged in and registered!",
        status: :success,
        api_key: @model.api_key,
        email: @model.email
      }.to_json
    else
      { message: "Account with this email already exists!",
        status: :error,
        email: @model.email
      }.to_json
    end


      #binding.pry
    #   @model = Account.where(:name => @name).first!
    #     if @model.password_digest == BCrypt::Engine.hash_secret(@password, @model.password)
    #       @account_message = "Hello, welcome back!"
    #
    #   session[:name] = @model
    #   @model = session[:user][:name]
    #   @model.to_json
    #   this code never runs
    # else
    #   "You did not sign up in correctly"
    # end
    # get '/logout' do
    # 		session[:name] = nil
    # 		@name = nil
    # 		redirect '/'
    # 	end
  end
end
