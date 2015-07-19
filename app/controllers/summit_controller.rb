class SummitController < ApplicationController
  def create
  	
  end

  def new
  	@user = User.new
  	@app_sub = ApplicationSubmission.new
  end
end
