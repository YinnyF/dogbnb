# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require './lib/property'
require 'sinatra/flash'
require_relative 'database_connection_setup'

class DogBnB < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect '/myaccount'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/sessions/new'
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
    Property.create(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_to: params[:available_to])
    redirect '/property'
  end

  get '/property' do
    @properties = Property.all
    erb :'property/index'
  end

  run! if app_file == $PROGRAM_NAME

end
