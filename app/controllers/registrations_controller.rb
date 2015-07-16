class RegistrationsController < Devise::RegistrationsController
  def create
    u = User.create(sign_up_params)
    s = params[:user][:form_id]
    sign_in(:user, User.find(u.id))
    redirect_to "/application_create/" + s.to_s + "/" + u.id.to_s
  end

  def new
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