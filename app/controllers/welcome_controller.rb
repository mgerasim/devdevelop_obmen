class WelcomeController < ApplicationController
  def index
    @cryptocurrencies =Cryptocurrency.all
    @current = params[:currency]
    if @current == nil then
	@current = Cryptocurrency.first.id
    end
  end
end
