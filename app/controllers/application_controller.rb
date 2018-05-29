class ApplicationController < ActionController::Base
	include SessionHelper
	  before_action :require_login
	def default_url_options
    	if Rails.env.production?
      		{ :port => 81}
    	end
  end
	  private
	  def require_login
	    Rails.logger.error('test')
	    Rails.logger.error(logged_in?)
	    if !logged_in?
		flash[:danger] = "Вы должны ввести пароль для входа"
		redirect_to login_path # прерывает цикл запроса
	    end
	  end
end
