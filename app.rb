require 'sinatra/base'
require 'sinatra/reloader'

class DogBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello DogBnB!'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/myaccount' do
    @name = params['name']
    redirect '/myaccount'
  end

  get '/myaccount' do
    erb :"users/myaccount"
  end

  run! if app_file == $0
end

