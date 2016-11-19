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


  set :views, File.expand_path('../../views', __FILE__)
  set :public_dir, File.expand_path('../../public', __FILE__)
#enable session
  enable :sessions

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

  not_found do
    ejs :notfound
  end

  get '/' do
    {:message => 'Home page not designed yet. Whoops.'}.to_json
  end
end
