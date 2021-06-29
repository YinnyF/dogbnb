require 'sinatra/base'
require 'sinatra/reloader'
require './lib/listing'

class DogBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello DogBnB!'
  end

  get '/listings' do
    @listings = Listing.all
    erb :'listings/index'
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  # post '/listings' do
  #   Listing.create(name: params[:name])
  #   redirect '/listings'
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

