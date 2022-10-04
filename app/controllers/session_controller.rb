class SessionController < ApplicationController
  include SessionHelper
  before_action :redirect_user, except: [:logout]

  def index
    @users = User.all
  end

  def create
    @user = User.find_by(phone: params[:phone])
    if !(@user.nil?)
      sign_in
      Rails.logger.info "Usuario Login ##{current_user.id}"
      redirect_to user_profile_path
    else
      Rails.logger.info "Usuario Tentativa Login #Phone: #{params[:phone]}"
      current_user = nil
      redirect_to root_url, notice: "Erro, login não encontrado"
    end
  end

  def logout
    Rails.logger.info "Usuario Logout ##{current_user.id}"
    session.delete(:user_id)
    current_user = nil
    redirect_to root_url
  end
end
