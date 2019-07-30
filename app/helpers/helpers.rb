class Helpers

  # Find user in database; return user object
  def self.current_user(session)
    User.find_by(id: session[:user_id])
  end

  # Return true if user_id is in session hash
  def self.is_logged_in?(session)
    !!session[:user_id]
  end

end