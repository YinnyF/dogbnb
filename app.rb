require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require_relative 'database_connection_setup'

class DogBnB < Sinatra::Base
  enable :sessions
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
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/myaccount'
  end

  get '/myaccount' do
    @user = User.find(session[:user_id])
    erb :"users/myaccount"
  end

  run! if app_file == $0
end
