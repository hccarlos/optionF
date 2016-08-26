class GroupsController < ApplicationController
  before_action :require_login, only: [:index, :create, :show, :destroy]
  before_action :require_correct_user, only: [:destroy]

#################################################
  def index
## should render the dashboard page
		## fetch all groups and put into @groups
		@groups = Group.all
  end


#################################################
  def create
## should create a new group given group name and description
	## should be current_user/session[user_id]
		@group = Group.new( name: params[:group_name], description: params[:group_description] , user: current_user )
		if @group.save
  		flash[:notice] = "Group successfully created"
  		Membership.create(user: current_user, group: Group.last)
  	else
  		flash[:errors] = @group.errors.full_messages
  	end
  	redirect_to "/groups"
	## check whether validations passed
	## stay in same page
	## give error message, if any
	## should also create a membership adding user_id = current_user.id, and group_id = Group.last.id
	### Membership.create(user_id = current_user.id, group_id = Group.last.id)
  end


#################################################
  def show
## should show individual group info
		@group = Group.find(params[:id])
	end


#################################################
	def destroy
		@group = Group.find(params[:id])
		@group.destroy
		redirect_to "/groups"
## should destroy group, only correct user may do so
	end


#################################################
# private
# 	def group_params
# 		params.require(:group).permit(:name, :description)
# 	end

end