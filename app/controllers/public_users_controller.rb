class PublicUsersController < ApplicationController
  before_action :set_user,      only: %i[ show ]
  after_action  :visits_users,     only: %i[ show ]
  layout 'users_backoffice'
  
  def index
    @users = User.where.not(token_public: [nil, ""]).order(:name_user).page(params[:page]).per(5)
    @user = nil
    # @users.joins(:ahoy_visit).group("user").count
  end
  
  def show
  end
  
  
  protected
  
  def visits_users
  end

  private

  def set_user
    @user = User.find_by(token_public: params[:token_public])
    ahoy.authenticate(@user)
  end
end
