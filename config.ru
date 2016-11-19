require 'sinatra/base'

# controllers
require './controllers/application_controller'
require './controllers/cat_controller'
require './controllers/dog_controller'
require './controllers/blog_controller'
require './controllers/account_controller'
# model
require './models/cat'
require './models/dog'
require './models/post'
require './models/account'
require '.models/account/register'
# map routes
map('/') { run ApplicationController }
map('/api/cats') { run CatsController }
map('/api/dogs') { run DogsController }
map('/api/posts') { run BlogController }
map('/api/accounts') { run AccountController }
