class SessionController < ApplicationController
  include SessionHelper
  before_action :block_access, except: [:destroy]

  def index
    @users = User.all
  end

  def sign
    @user = User.find_by(phone: params[:phone])
    unless @user.nil?
      sign_in()
      redirect_to @user
    end
  end

  def logout
    session.delete(:user_id)
    current_user = nil
    redirect_to root_url
  end

end
