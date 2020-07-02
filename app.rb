# frozen_string_literal: true
require 'sinatra/base'
require './lib/bookmarks.rb'

class App < Sinatra::Base
  
  enable :sessions

  get '/' do
    @url = session[:url]
    session[:url] = nil
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  post '/add_submit' do
    Bookmarks.add(params[:url], params[:title])
    session[:url] = params[:url]
    redirect '/'
  end

  get '/add' do
    erb :add
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
