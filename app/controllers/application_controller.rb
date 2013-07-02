# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
# protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  helper_method :current_user
  public
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def check_login
  	unless current_user
  		redirect_to login_path
  	end
  end
  def onlogin
  	if current_user
  		redirect_to root_path
  	end
  end

  def use_meetingroom
    unless current_user == User.find_by_email('abc@gmail.com')
      redirect_to root_path
    end
  end
end
