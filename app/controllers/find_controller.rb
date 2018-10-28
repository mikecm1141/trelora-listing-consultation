class FindController < ApplicationController
  def index; end

  def create
  	clean_address = params[:address].gsub(/[[:punct:]]/, '').downcase
  	find_property = UserProperty.find_by_address(clean_address)

  	if find_property.nil?
  		flash[:alert] = "* Address Not Found"
  		render :index
  	end

  	session[:property_found] = find_property.listing_id
  	redirect_to '/prepare'
  end
end
