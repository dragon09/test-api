require 'bundler'
Bundler.require
require 'sinatra/base'
require 'sinatra/contrib'
require 'carrierwave'


@environment = ENV['RACK_ENV'] || 'development'
@dbconfig = YAML.load(File.read('./config/database.yml'))

# ActiveRecord::Base.establish_connection(@dbconfig[@environment] )


require './uploaders/image_uploader'

# model
require './models/post'
require './models/account'
require './models/comment'
require './models/image'



# controllers
require './controllers/application_controller'
require './controllers/blog_controller'
require './controllers/accounts_controller'
require './controllers/sessions_controller'
require './controllers/comments_controller'
require './controllers/images_controller'
# require './controllers/register_controller'




# map routes
map('/') { run ApplicationController }
map('/api/posts') { run BlogController }
map('/api/accounts') { run AccountsController }
map('/api/sessions') { run SessionsController }
map('/api/comments') { run CommentsController }
map('/api/images') { run ImagesController }
