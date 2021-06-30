# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require './lib/property'

require_relative 'database_connection_setup'

class DogBnB < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(result[0]['id'], result[0]['name'], result[0]['email'], result[0]['password'])
  
    session[:user_id] = user.id
    redirect '/myaccount'
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
    @user = User.find(id: session[:user_id])
    erb :"users/myaccount"
  end

  get '/property/new' do
    erb :'property/new'
  end

  post '/property' do
    Property.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/property'
  end

  get '/property' do
    @properties = Property.all
    erb :'property/index'
  end

  run! if app_file == $PROGRAM_NAME

end
