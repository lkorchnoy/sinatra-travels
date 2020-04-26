# require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end

  # post '/' do
  #  if @travel = Travel.all.find_by(name: params[:travel])
  # redirect "/travels/#{@travel.id}"
  #  else  
  # redirect "/"
  #  end 
  # end 

 

end 
