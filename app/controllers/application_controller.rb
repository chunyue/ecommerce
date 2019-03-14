class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_cart

  private

    def authenticate_admin
      unless current_user.admin?
        flash[:alert] = "Not allow!"
        redirect_to root_path
      end  
    end

    def current_cart
      @cart || set_cart
    end

    def set_cart
      
    end

end
