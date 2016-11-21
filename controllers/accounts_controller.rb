class AccountsController < ApplicationController
  enable :sessions
  @username = ''

  get '/' do
    Account.all.to_json
  end

  # get '/:id' do
  #   @model = Account.find(params[:id])
  #   @model.to_json
  # end

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

      redirect '/'
    else
      "You did not sign up in correctly"
    end

    @model = Account.new
    @model.name = @name
    @model.email = @email
    @model.password = params[:password]
    @model.password_confirmation = params[:password]
    @model.save
    @account_message = "You are now logged in and registered!"

    # session[:name] = @model
    # @model = session[:user][:name]
    @model.to_json
  end

end
