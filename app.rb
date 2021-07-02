# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require './lib/property'
require './lib/booking'
require 'sinatra/flash'
require_relative 'database_connection_setup'
# :nodoc:
class DogBnB < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  get '/' do
    redirect '/property' if session[:user_id]
    erb :index
  end

  get '/sessions/new' do
    redirect '/property' if session[:user_id]
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
    redirect '/property' if session[:user_id]
    erb :"users/new"
  end

  post '/myaccount' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/myaccount'
  end

  get '/myaccount' do
    unless session[:user_id]
      flash[:notice] = 'Please log in first'
      redirect '/sessions/new'
    end
    @user = User.find(id: session[:user_id])
    erb :"users/myaccount"
  end

  get '/property/new' do
    unless session[:user_id]
      flash[:notice] = 'Please log in first'
      redirect '/sessions/new'
    end
    @user = User.find(id: session[:user_id])
    erb :'property/new'
  end

  post '/property' do
    if params[:image] && params[:image][:filename]
      filename = params[:image][:filename]
      file = params[:image][:tempfile]
      path = "./public/images/#{filename}"

      File.open(path, 'wb') do |f|
        f.write(file.read)
      end
    end

    if params[:image] && params[:image][:filename]
      Property.create(name: params[:name], description: params[:description], price: params[:price],
                      available_from: params[:available_from], available_to: params[:available_to],
                      owner_id: session[:user_id], image_route: params[:image][:filename])
    else
      Property.create(name: params[:name], description: params[:description], price: params[:price],
                      available_from: params[:available_from], available_to: params[:available_to],
                      owner_id: session[:user_id], image_route: 'default.jpg')
    end
    redirect '/property'
  end

  get '/property' do
    @user = User.find(id: session[:user_id])
    @properties = Property.all
    erb :'property/index'
  end

  get '/property/:id/book' do
    unless session[:user_id]
      flash[:notice] = 'Please log in first'
      redirect '/sessions/new'
    end
    @property_id = params[:id]
    @user = User.find(id: session[:user_id])
    @property = Property.who(property_id: @property_id)
    erb :'property/booking'
  end

  post '/property/:id/book' do
    @property_id = params[:id]
    @user = User.find(id: session[:user_id])
    @property = Property.who(property_id: @property_id)
    Booking.create(property_id: @property_id, renter_id: @user.id, owner_id: @property.owner_id)
    flash[:notice] = 'Your booking request has been sent.'
    redirect '/property'
  end

  get '/about' do
    erb :about
  end

  run! if app_file == $PROGRAM_NAME
end
