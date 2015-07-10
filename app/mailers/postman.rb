class Postman < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.postman.reject_email.subject
  #
  def reject_email(email)
    @greeting = "Hi"

    mail to: email, subject: "Your ASES Application Decision"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.postman.first_round_email.subject
  #
  def first_round_email(email)
    @greeting = "Hi"

    mail to: email, subject: "Your ASES Application Decision"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.postman.second_round_email.subject
  #
  def second_round_email(email)
    @greeting = "Hi"

    mail to: email, subject: "Your ASES Application Decision"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.postman.accept_email.subject
  #
  def accept_email(email)
    @greeting = "Hi"

    mail to: email, subject: "Your ASES Application Decision"
  end
end
