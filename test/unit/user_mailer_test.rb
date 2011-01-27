require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  def test_notify
    message = messages(:one)

    email = UserMailer.notify(message).deliver
    assert !ActionMailer::Base.deliveries.empty?

    assert_equal [UserMailer::SYSTEM_EMAIL], email.from
    assert_equal [message.target_email], email.to
    assert_equal "Karny Kutas - od kogo dostałeś?", email.subject
    assert_match /#{message.id}/, email.encoded
  end

end
