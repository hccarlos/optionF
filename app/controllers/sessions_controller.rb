class SessionsController < ApplicationController

#################################################
  def new
## this should display the login and registration page
  end


#################################################
  def login
## this should login user
  	@user = User.find_by_email(params[:email])
    if @user
    	if @user.authenticate(params[:password])
    		session[:user_id] = @user.id
    		redirect_to "/groups"
    	else
    		flash[:loginError] = "Invalid email/password combo"
    		redirect_to "/sessions/new"
    	end
    else
      flash[:loginError] = "No user by that email"
      redirect_to "/sessions/new"
    end
  end


#################################################
  def logout
## this should logout user
  	session[:user_id] = nil
  	redirect_to "/sessions/new"
  end


#################################################
end
