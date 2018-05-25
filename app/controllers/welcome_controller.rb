class WelcomeController < ApplicationController
  def index
    @cryptocurrencies =Cryptocurrency.all
    
    if params[:currency] == nil then
		@current = Cryptocurrency.first
    else
    	@current = Cryptocurrency.find(params[:currency])
    end
  end
end
