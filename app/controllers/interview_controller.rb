class InterviewController < ApplicationController
  def index
    @new_interview = Interview.new
    if current_user.is_admin?
  	  @interviews = Interview.all
      @my_interviews = @new_interview.belong_to_interviewer(current_user.id)
    elsif current_user.is_reviewer?
      @interviews = @new_interview.get_nil_interviewer
      @my_interviews = @new_interview.belong_to_interviewer(current_user.id)
    else
      @interviews = @new_interview.get_available_interviews
      @my_interviews = @new_interview.belong_to_applicant(current_user.id)
    end
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

  def signup
    interview = Interview.find(params[:id])
    if current_user.is_admin? or current_user.is_reviewer?
      interview.interviewer_id = current_user.id
    elsif current_user.is_applicant?
      interview.applicant_id = current_user.id
    end
    interview.save()
    redirect_to :back
  end

  def cancel
    interview = Interview.find(params[:id])
    if current_user.is_admin? or current_user.is_reviewer?
      interview.interviewer_id = nil
    elsif current_user.is_applicant?
      interview.applicant_id = nil
    end
    interview.save()
    redirect_to :back
  end

  private
  	def interview_params
  		params.require(:interview)
  	end
end
