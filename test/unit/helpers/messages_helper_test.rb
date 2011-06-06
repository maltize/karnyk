require 'test_helper'

class MessagesHelperTest < ActionView::TestCase

  def test_sexy
    body = "link karnykutas.com http://karnykutas.com/regulamin i to tyle :)"
    expected_body = "link <a href=\"http://karnykutas.com\" target=\"_blank\">http://karnykutas.com</a> <a href=\"http://karnykutas.com/regulamin\" target=\"_blank\">http://karnykutas.com/regulamin</a> i to tyle :)"
    assert_equal expected_body, sexy(body)
  end

end
