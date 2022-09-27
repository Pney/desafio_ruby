module SessionHelper
    def sign_in
      session[:user_id] = @user.id
    end
    
    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end
   
    def block_access
      unless current_user.present?
        redirect_to root_url
      end
    end

    def redirect_user
      if current_user.present?
        redirect_to user_profile_path
      end
    end


    def authorize_session
      if current_user.present?
        redirect_to root_url
      end
    end
end
