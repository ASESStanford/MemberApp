require 'test_helper'

class PostmanTest < ActionMailer::TestCase
  test "reject_email" do
    mail = Postman.reject_email
    assert_equal "Reject email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "first_round_email" do
    mail = Postman.first_round_email
    assert_equal "First round email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "second_round_email" do
    mail = Postman.second_round_email
    assert_equal "Second round email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "accept_email" do
    mail = Postman.accept_email
    assert_equal "Accept email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
