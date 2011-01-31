require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  def test_notify
    message = messages(:one)

    email = UserMailer.notify(message).deliver
    assert !ActionMailer::Base.deliveries.empty?

    assert_equal [UserMailer::SYSTEM_EMAIL], email.from
    assert_equal [message.target_email], email.to
    assert_match /#{message.id}/, email.encoded
  end

  def test_notify_copy
    message = messages(:one)

    email = UserMailer.notify_copy(message).deliver
    assert !ActionMailer::Base.deliveries.empty?

    assert_equal [UserMailer::SYSTEM_EMAIL], email.from
    assert_equal ["info@karnykutas.com"], email.to
    assert_match /#{message.id}/, email.encoded
  end

end
