class UserRoleController < ApplicationController
  def edit
  end

  def change_role
  	u = User.find(params[:user])
  	u.role = params[:role]
  	u.save
  	redirect_to :back
  end

  def json
  	@users = User.all.map{|j| j }.select{|x| x.name && x.name.downcase.start_with?(params[:term].downcase) }
  	render :json => @users.collect{|x| {label: x.name, value: x.id} }.compact
  end
end
