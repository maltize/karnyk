require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def test_valid
    assert messages(:one).valid?
  end

  def test_make_permalink
    messages(:one).target_email = 'my@email.lol'
    assert_equal "my_email_lol", messages(:one).send(:make_permalink)

    messages(:one).target_email = 'you2!_are_h-o-t$lol@l-o-l.lol'
    assert_equal "you2__are_h_o_t_lol_l_o_l_lol", messages(:one).send(:make_permalink)
  end

  def test_make_permalink_uniq
    assert_equal 'you_email_lol', messages(:one).permalink

    message = messages(:one).clone
    message.save
    assert_equal 'you_email_lol2', message.permalink

    message = messages(:one).clone
    message.save
    assert_equal 'you_email_lol3', message.permalink
  end

end
