module SessionsHelper

    # Logs out the current user.
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
    
end
