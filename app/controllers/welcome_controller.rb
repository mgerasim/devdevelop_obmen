class WelcomeController < ApplicationController
	skip_before_action :require_login
  def index
    @cryptocurrencies = Cryptocurrency.all
    
    if params[:currency] == nil then
		@current = Cryptocurrency.first
    else
    	@current = Cryptocurrency.find(params[:currency])
    end

    @burses = Burse.includes(:courses).where(courses: {cryptocurrency: @current}).order('courses.value ASC')

  end
end
