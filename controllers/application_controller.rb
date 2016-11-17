class ApplicationController < Sinatra::Base
  require 'bundler'
  Bundler.require

  register Sinatra::CrossOrigin

  ActiveRecord::Base.establish_connection(
      :adapter => 'mysql2',
      :database => 'cats_rescue'
  )

  require 'sinatra'
  require 'sinatra/cross_origin'

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

  get '/' do
    {:message => 'Home page not designed yet. Whoops.'}.to_json
  end
end