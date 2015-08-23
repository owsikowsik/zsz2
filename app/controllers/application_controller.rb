class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_locale
  
  private 
  
  def set_locale 
      I18n.locale = (params[:locale] if params[:locale].present?) || cookies[:locale] || 'pl'
      cookies[:locale] = I18n.locale if cookies[:locale] != I18n.locale.to_s
  end
	
	
	def user_check
		unless session[:user_id]

				flash[:notice] = "Nie posiadasz wystarczających praw"
				redirect_to(:controller => 'access', :action => 'login')
				return false
			else
				return true
		end
	end


  
end
