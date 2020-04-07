class TravelsController < ApplicationController 
  

    get '/travels' do 
      @travels = Travel.all 
        erb :'travels/index' 
    end



    get '/travels/new' do
    if !Helpers.is_logged_in?(session) 
        redirect '/'
    end
    erb :'travels/new'
end

post '/travels' do
    #if Helpers.current_user(session).id == Travel.find_by(id: params[:id]).user_id
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
        redirect to '/'  #travels
    end

    erb :'travels/show'
end


    

end