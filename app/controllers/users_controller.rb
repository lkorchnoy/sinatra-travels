	

class UsersController < ApplicationController 
  
 
get '/users' do 
    if Helpers.is_logged_in?(session)
      @users = User.all 
    else 
      redirect to '/'
    end
    erb :'users/index' 
end


get '/signup' do
    if Helpers.is_logged_in?(session)
      user = Helpers.current_user(session)
      redirect to "/users/#{user.id}"
    end
    erb :'users/signup'
end

get '/login' do 
    if Helpers.is_logged_in?(session)
      user = Helpers.current_user(session)
      redirect to "/users/#{user.id}"
    end
    erb :'users/login'
end

post '/login' do 
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect to "/users/#{user.id}"
    else     
      redirect to '/signup'
    end
end

post '/signup' do 
   user = User.create(params) #input names that match column names in my table
    if user.valid?
      session[:user_id] = user.id 
      redirect to "/users/#{user.id}"
    else    
      redirect to '/signup'
    end
  end

get '/users/:id' do 
    if Helpers.is_logged_in?(session) && User.find_by(id: params[:id])
      @user = User.find_by(id: params[:id])
      @travels = @user.travels 
    else 
      redirect to '/'
    end
    erb :'users/show'
end

get '/logout' do 
    session.clear
    redirect to '/'
end

end
