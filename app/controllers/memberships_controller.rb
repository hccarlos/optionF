class MembershipsController < ApplicationController
# before_action :require_login, only: [:create, :destroy]

#################################################
	def create
## create a membership relationship --> Join group
		if Membership.find_by_user_id_and_group_id(current_user.id, params[:group_id])
			flash[:alert] = "Already in this group!"
		else
			Membership.create(user: current_user, group_id: params[:group_id])
		end
		redirect_to "/groups/#{params[:group_id]}"
	end

#################################################
	def destroy
## destroy a membership relationship --> Leave group
		@membership = Membership.find_by_user_id_and_group_id(current_user.id, params[:group_id])
		@membership.destroy
		redirect_to "/groups/#{params[:group_id]}"
	end


#################################################
end