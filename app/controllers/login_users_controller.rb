class LoginUsersController < ApplicationController
  before_action :user_info, :validate_user, on: :create

  def new: end

  def create
    session[:addresses] = user_info.get_addresses
    session[:token] = user_info.get_token
    redirect_to '/find-property'
  end

  private

  def user_info
    UserInfoFacade.new(user_params)
  end

  def validate_user
    render :new, message: user_info.get_user_info[:data][:error] if user_info.get_user_info[:data][:status] == 422
  end

  def user_params
    params.permit(:email, :password)
  end
end
