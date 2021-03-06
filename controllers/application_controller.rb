class ApplicationController < Sinatra::Base
  require 'bundler'
  Bundler.require


  @account_message = ""
  @username = ''

  register Sinatra::CrossOrigin

  ActiveRecord::Base.establish_connection(
     :adapter => 'mysql2',
     :database => 'project3'

    #  db info would go here

 )

  # ActiveRecord::Base.establish_connection(
  #   :adapter => ENV['DB_ADAPTER'],
  #   :database => ENV['DB_NAME'],
  #   :username => ENV['DB_USER'],
  #   :password => ENV['DB_PASSWORD'],
  #   :host => ENV['DB_HOST']
  # )

  require 'sinatra'
  require 'sinatra/cross_origin'
  # require "carrierwave/orm/activerecord"


  set :views, File.expand_path('../../views', __FILE__)
  set :public_dir, File.expand_path('../../public', __FILE__)
  CarrierWave.configure do |config|
    config.root = File.dirname(__FILE__) + "/public"
  end

  set :allow_origin, :any
  set :allow_methods, [:get, :post, :patch, :delete]

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  end

  configure do
    enable :cross_origin
  end



  #enable session
  enable :sessions, :logging

  not_found do
    #ejs :notfound
    {:message => 'You are not logged in.'}.to_json
  end

  # get '/account' do
# end

  def is_api_key_valid?(api_key)
    @model = Account.where(api_key: api_key)
    if @model != nil
      return true
    else
      return false
    end
  end

  get '/' do
    {:message => 'Home page not designed yet. Whoops.'}.to_json
  end
end
