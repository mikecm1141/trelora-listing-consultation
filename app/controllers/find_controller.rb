class FindController < ApplicationController
  def index
    @addresses = session[:addresses]
  end
end