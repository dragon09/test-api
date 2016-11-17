class CatsController < ApplicationController

  get '/' do
    @model = Cat.all
    @model.to_json
  end

  get '/:id' do
    @model = Cat.find(params[:id])
    @model.to_json
  end

  post '/' do
    @model = Cat.new
    @model.name = params[:name]
    @model.note = params[:note]
    @model.image = params[:image]
    @model.save
    @model.to_json
  end

  patch '/:id' do
    @model = Cat.find(params[:id])
    @model.name = params[:name]
    @model.note = params[:note]
    @model.image = params[:image]
    @model.save
    @model.to_json
  end

  delete '/:id' do
    #binding.pry
    @model = Cat.find(params[:id])
    @model.destroy
    {:message => 'Your cat with an id of ' + params[:id] + ' was adopted :)'}.to_json
  end

end