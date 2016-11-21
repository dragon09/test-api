require 'bundler'
Bundler.require
require 'sinatra/base'
require 'sinatra/contrib'

# model
require './models/cat'
require './models/post'
require './models/account'
require './models/comment'


# controllers
require './controllers/application_controller'
require './controllers/cat_controller'
require './controllers/blog_controller'
require './controllers/accounts_controller'
require './controllers/sessions_controller'
require './controllers/comment_controller'



# map routes
map('/') { run ApplicationController }
map('/api/cats') { run CatsController }
map('/api/posts') { run BlogController }
map('/api/accounts') { run AccountsController }
map('/api/sessions') { run SessionsController }
map('/api/comments') { run CommentsController }
