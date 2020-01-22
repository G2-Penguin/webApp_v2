class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_action :set_current_user
  
    def set_current_user
    @current_user = User.find_by(id: session[:user_id])
    end
  
    def forget_selected_item
      if session[:selected_item]
        session[:selected_item] = nil
      end
    end
  
    #helper_method :forget_selected_item
    helper_method :set_current_user
end
