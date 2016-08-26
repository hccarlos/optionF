class UsersController < ApplicationController
	# before_action :require_login, except: [:create]
  # before_action :require_correct_user, only: []

#################################################
  def create
## routed from the "/sessions/new" view page of sessions controller
## should create new user
	  @user = User.new( user_params )
  	if @user.save
      session[:user_id] = @user.id
  		redirect_to "/groups"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to "/sessions/new"
  	end
	end


#################################################
private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

end