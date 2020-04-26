class Helpers 


    def self.current_user(session)
       User.find_by(id: session[:user_id])
    end

    def self.is_logged_in?(session)
        session[:user_id] ? true : false
    end

    def self.authenticate_resource(session, resource)
        if !(is_logged_in?(session) && resource.user == current_user)
            yield
        end
    end



end
