# Preview all emails at http://localhost:3000/rails/mailers/postman
class PostmanPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/postman/reject_email
  def reject_email
    Postman.reject_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/postman/first_round_email
  def first_round_email
    Postman.first_round_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/postman/second_round_email
  def second_round_email
    Postman.second_round_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/postman/accept_email
  def accept_email
    Postman.accept_email
  end

end
