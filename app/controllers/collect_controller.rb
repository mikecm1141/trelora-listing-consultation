class CollectController < ApplicationController
  def new
    @property_facade = PropertyFacade.new(session[:property_found], current_user.http_auth_token)
  end

  def create

  end

  private

  def collect_params
    params.permit(:about_home,:recommended_list_price,:update_client_enthusiasm,
                  :buyer_agent_commission, :about_the_seller,
                  :credit_card_number, :cc_month, :cc_year)
  end

  def collect_payload
    {
      email: current_user.email,
      address: session[:property_found],
      name: current_user.name,
      about_this_home: collect_params[:about_home],
      recommended_list_price: collect_params[:recommended_list_price],
      client_enthusiasm: collect_params[:update_client_enthusiasm],
      commission: collect_params[:buyer_agent_commission],
      about_the_seller: collect_params[:about_the_seller],
      credit_card: collect_params[:credit_card_number],
      exp_date: collect_params[:cc_month] + "/" + collect_params[:cc_year]
    }
  end
end
