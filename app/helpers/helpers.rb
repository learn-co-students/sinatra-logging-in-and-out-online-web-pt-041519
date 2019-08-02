require 'pry'
class Helpers

    def self.current_user(session)
        user_id = session[:user_id]
        user = User.find_by(id: user_id)
        user
    end

    def self.is_logged_in?(session)
        !!session[:user_id]
    end

end