module ApiFlashcards
  class ApplicationController < ActionController::Base
    # before_action :authenticate
    
  private
    def authenticate
      authenticate_or_request_with_http_basic do |email, password| 
        user = User.authenticate(email, password)
        if user
          current_user = user
        else
          render json: {message: 'Authentication failed'}, status: 401
        end
      end
    end
  end
end
