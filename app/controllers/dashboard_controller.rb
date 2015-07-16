class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
  	redirect_to welcome_index_path if !current_user.is_admin?
  	@owned_forms = current_user.application_forms
  end

end
