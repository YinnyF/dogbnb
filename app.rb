require 'sinatra/base'
require 'sinatra/reloader'

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
    erb :'/property/index'
  end
  
  run! if app_file == $0
end

