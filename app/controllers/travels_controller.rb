class TravelsController < ApplicationController 
  

get '/travels' do 
    @travels = Travel.all 
    erb :'travels/index' 
end

get '/travels/new' do
    if !Helpers.is_logged_in?(session) 
      flash[:message] = "Please sign up or log in to use Traveling around the globe App"   
      redirect '/'
    end
      erb :'travels/new'
end

    

post '/travels' do
    travel = Travel.create(params)
    user = Helpers.current_user(session)
    travel.user = user 
    travel.save
    redirect to "/users/#{user.id}"
end

get '/travels/:id' do 
    if !Helpers.is_logged_in?(session) 
      redirect '/'
    end
      @travel = Travel.find_by(id: params[:id])
    if !@travel 
      flash[:message] = "Please sign up or log in to use Traveling around the globe App"   
      redirect to '/'  #travels
    end
      erb :'travels/show'
end


get '/travels/:id/edit' do 
      @travel = Travel.find_by(id: params[:id])
    if !Helpers.is_logged_in?(session) || !@travel || @travel.user != Helpers.current_user(session)
      redirect '/'
    end
      erb :'/travels/edit'
end

patch '/travels/:id' do
      travel = Travel.find_by(id: params[:id])
    if travel && travel.user == Helpers.current_user(session)
      travel.update(params[:travel])
      redirect to "/travels/#{travel.id}"
    else   
      redirect to "/travels"
    end
end

delete '/travels/:id/delete' do 
      travel = Travel.find_by(id: params[:id])
    if travel && travel.user == Helpers.current_user(session)
      travel.destroy 
    end
      redirect to '/travels'
end

    

end