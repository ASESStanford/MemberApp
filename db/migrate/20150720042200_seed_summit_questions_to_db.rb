class SeedSummitQuestionsToDb < ActiveRecord::Migration
  def change
  	Question.create(id: 6, application_form_id: 1, text:"Gender")
  	Question.create(id: 7, application_form_id: 1, text:"Birthday")
  	Question.create(id: 8, application_form_id: 1, text:"Interview ID")

  	Question.create(id: 9, application_form_id: 1, text:"Nationality")
  	Question.create(id: 12, application_form_id: 1, text:"Academic Major")
  	Question.create(id: 10, application_form_id: 1, text:"Ethnicity")
  	Question.create(id: 13, application_form_id: 1, text:"Year of Study")
  	Question.create(id: 11, application_form_id: 1, text:"University Name")
  	Question.create(id: 14, application_form_id: 1, text:"Degree Program")

  	Question.create(id: 15, application_form_id: 1, text:"Please list 5 words you would use to describe yourself")
  	Question.create(id: 16, application_form_id: 1, text:"What are some of your hobbies and interests? What do you do for fun?")
  	Question.create(id: 17, application_form_id: 1, text:"In one sentence, why should we select you for ASES Summit 2016?")
  	Question.create(id: 18, application_form_id: 1, text:"How did you hear about ASES Summit?")
  	Question.create(id: 19, application_form_id: 1, text:"Are you affiliated with an ASES chapter? (optional)")
  	Question.create(id: 20, application_form_id: 1, text:"What organizations or activities are you involved with outside of school?")

  	Question.create(id: 21, application_form_id: 1, text:"Please discuss your entrepreneurship or business experience. How will you contribute to Summit's dynamic and vivacious atmosphere?")
  	Question.create(id: 22, application_form_id: 1, text:"Why do you want to be a part of ASES Summit? What do you hope to gain from Summit?")
  	Question.create(id: 23, application_form_id: 1, text:"What is your favorite mobile app? Why is it your favorite, what makes it stand out to you?")
  	Question.create(id: 24, application_form_id: 1, text:"What else should we know about you? (optional)")
  end
end
