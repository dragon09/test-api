class DogsController < ApplicationController
    get '/' do
      @model = Dog.all
      @model.to_json
    end

    get '/:id' do
      @model = Dog.find(params[:id])
      @model.to_json
    end

    post '/' do
      @model = Dog.new
      @model.name = params[:name]
      @model.note = params[:note]
      @model.image = params[:image]
      @model.save
      @model.to_json
    end

    patch '/:id' do
      @model = Dog.find(params[:id])
      @model.name = params[:name]
      @model.note = params[:note]
      @model.image = params[:image]
      @model.save
      @model.to_json
    end

    delete '/:id' do
      #binding.pry
      @model = Dog.find(params[:id])
      @model.destroy
      {:message => 'Your dog with an id of ' + params[:id] + ' was adopted :)'}.to_json
    end
end