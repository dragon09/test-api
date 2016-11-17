require 'sinatra/base'

# controllers
require './controllers/application_controller'
require './controllers/cat_controller'
require './controllers/dog_controller'
require './controllers/blog_controller'
# model
require './models/cat'
require './models/dog'
require './models/post'
# map routes
map('/') { run ApplicationController }
map('/api/cats') { run CatsController }
map('/api/dogs') { run DogsController }
map('/api/posts') { run BlogController }