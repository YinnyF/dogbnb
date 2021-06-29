# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/property'
require_relative 'database_connection_setup'

class DogBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello DogBnB!'
  end

  get '/property/new' do
    erb :'property/new'
  end

  post '/property' do
    Property.create(description: params[:description], price: params[:price])
    redirect '/property'
  end

  get '/property' do
    @properties = Property.all
    erb :'property/index'
  end

  run! if app_file == $PROGRAM_NAME
end

