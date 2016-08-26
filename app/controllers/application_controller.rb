class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
  	redirect_to '/sessions/new' if session[:user_id] == nil
  end

  def require_correct_user
    user = User.find(params[:user_id])
    if user
      redirect_to "/groups" if current_user != user
      # flash[:errors] = ""
    else
      redirect_to "sessions/new"
    end
  end

#################################################
#should get the current_user in view partials
  helper_method :current_user

end
