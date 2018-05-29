class SessionController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create, :destroy]
  skip_before_action :verify_authenticity_token
  def new
  	
  end

  def create
  	Rails.logger.error(logged_in?)
        Rails.logger.error("aut entering")
        if authenticate?(params[:session][:password]) 
            Rails.logger.error("ok:")
            Rails.logger.error(session[:logged_in])
            log_in
            Rails.logger.error(session[:logged_in])
            Rails.logger.error(logged_in?)
            flash[:success] = "Добро пожаловать в административную часть!"
            redirect_to courses_path
        else
    	    flash.now[:danger] = 'Не верно указан пароль' # Not quite rig
    	    render 'new'
        end
  end

  def destroy
        log_out
        redirect_to root_url
  end
end
