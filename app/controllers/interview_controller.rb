class InterviewController < ApplicationController
  def index
  	@interviews = Interview.all
  	@new_interview = Interview.new
  end

  def show
  end

  def update
  end

  def create
  	event = interview_params
  	interview_time = DateTime.civil event["time(1i)"].to_i, event["time(2i)"].to_i, event["time(3i)"].to_i, event["time(4i)"].to_i, event["time(5i)"].to_i
  	i = Interview.new
  	i.time = interview_time
  	i.location = event[:location]
  	i.save
  	redirect_to :back
  end

  private
  	def interview_params
  		params.require(:interview)
  	end
end
