class SessionsController < ApplicationController

  post '/' do
    @account = Account.find_by email: params[:email]
    if @account && @account.authenticate(params[:password])
      { message: "You are now logged in and registered!",
        status: :success,
        api_key: @account.api_key,
        email: @account.email
      }.to_json
    else
      # "You entered wrong username or password, please try again!"
      {status: :error}.to_json
    end
 end


end
