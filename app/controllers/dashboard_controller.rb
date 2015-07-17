class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
  	redirect_to "/new_app_submission/1" if !current_user
  	@owned_forms = current_user.application_forms
  end

end
