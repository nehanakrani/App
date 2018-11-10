class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update ,:destroy] 
#show all user 
def index
		@user = User.find_by(params[:id])
        @users = User.all
		if params[:user_id].present?
        	@events = Event.where(user_id: params[:user_id])
        else
        	@events = Event.where(user_id: current_user.id)
        end
	end
#update user 
	def update
		if @user.update_attributes(user_params)
	    	flash[:success] = "Profile updated"
	    	redirect_to @user
	    else
	      	render :edit
	    end
	end
# Use callbacks to share common setup or constraints between actions.
private
	def set_user
	     @user = User.find(params[:id])
	end
	def user_params
	    params.require(:user).permit(:name, :email,:phone_number,:gender,:date_of_birth,:password,
	                                     :password_confirmation,:current_password,:role,pictures_attributes: :picture)
	end
end






