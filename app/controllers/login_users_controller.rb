class LoginUsersController < ApplicationController
  before_action :user_info_facade, :validate_user, only: :create
  after_action :save_properties, only: :create

  def new; end

  def create
    session[:token] = user_info_facade.token
    save_user
    redirect_to '/find-property'
  end

  private

  attr_reader :user

  def user_info_facade
    UserInfoFacade.new(user_params)
  end

  def validate_user
    if user_info_facade.status_code
      flash[:alert] = user_info_facade.error_msg
      render :new
    end
  end

  def save_user
    @user = User.find_or_initialize_by(http_auth_token: user_info_facade.token)
    user.update(name: user_info_facade.name, email: user_info_facade.email)
    user.save
  end

  def save_properties
    user_info_facade.addresses.each do |address|
      UserProperty.find_or_create_by(user_id: user.id, listing_id: address)
    end
  end

  def user_params
    params.permit(:email, :password)
  end
end
