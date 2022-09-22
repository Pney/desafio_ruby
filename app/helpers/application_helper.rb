module ApplicationHelper
  include SessionHelper

  def current_user
      @current_user = User.find_by(id: session[:user_id])
  end

  def authorize_session
    if current_user.present?
      redirect_to root_url
    end
  end
end
