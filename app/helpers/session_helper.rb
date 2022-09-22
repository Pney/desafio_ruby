module SessionHelper
    def sign_in
      session[:user_id] = @user.id
    end
   
    def block_access
      if current_user.present?
        redirect_to users_path
      end
    end

    def current_user
      byebug
      @current_user = User.find_by(id: session[:user_id])
      @current_user
    end

  def authorize_session
    if current_user.present?
      redirect_to root_url
    end
  end
end
