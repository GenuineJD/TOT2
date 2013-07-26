class UserController < ApplicationController

	layout '_navigation'
	before_filter :authorize, :only => [:users, :changerole]

	def users
		@users = User.all
	end

	def changerole
		# params {"controller"=>"user", "action"=>"changerole", "user_id"=>"1", "role"=>"2"}

		userId = params[:user_id]
		role = params[:role]
		
		user = User.find(userId)
		if user && user != current_user
			user.role = role
			user.save
		end

		redirect_to '/admin/users'
	end

	def delete
		userId = params[:user_id]
		user = User.find(userId)
		if user && user != current_user
			user.destroy
		end

		redirect_to '/admin/users'
	end

	#############################################################################
	# private methods

	private	

	# check access permission
	def authorize
		if current_user == nil || !(can? :manage, @user)
			flash[:notice] = "You don't have permission to access users page."
			redirect_to '/admin'
			return
		end
	end
end