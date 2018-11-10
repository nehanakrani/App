 class RegistrationsController < Devise::RegistrationsController
 	def new
 	    build_resource
 		self.resource.pictures.build
 	end
    
    private
    def sign_up_params
   		params.require(:user).permit(:email,:name,:phone_number,:gender,:date_of_birth,:password, :password_confirmation,:current_password,:role,pictures_attributes: [:picture])
    end
    def account_update_params
     	params.require(:user).permit(:email,:name,:phone_number,:gender,:date_of_birth,:password, :password_confirmation,:current_password,:role,pictures_attributes: [:picture])
    end
end