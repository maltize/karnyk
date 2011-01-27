require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def test_valid
    assert messages(:one).valid?
  end
end
