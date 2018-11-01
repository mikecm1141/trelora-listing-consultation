class FindController < ApplicationController
  before_action :find_property, :validate_address, only: :create

  def index; end

  def create
  	session[:property_found] = find_property.listing_id
    session.delete(:complete)
  	redirect_to '/prepare'
  end

  private

  def clean_address
    params[:address].gsub(/[[:punct:]]/, '').downcase
  end

  def find_property
    @find_property ||= UserProperty.where(user_id: current_user.id, address: clean_address).first
  end

  def validate_address
    if find_property.nil?
      flash[:alert] = "* Address Not Found"
      render :index
    end
  end
end
