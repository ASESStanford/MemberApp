class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        if params[:user].has_key?(:form_id) && params[:user][:form_id].to_i != 0
          s = params[:user][:form_id]
          sign_in(:user, User.find(resource.id))
          redirect_to "/application_create/" + s.to_s + "/" + resource.id.to_s
        else #normal/admin SIGN UP - should probably handle differently
          resource.role = 2
          resource.save
          sign_in(:user, User.find(resource.id))
          redirect_to dashboard_index_path
        end 
        #respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
      
  end

  def new
    @u = User.new
    super
  end
  
  private
	  def sign_up_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation,:image, :resume)
	  end

	  def account_update_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password,:image, :resume)
	  end
end