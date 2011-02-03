module ApplicationHelper

  # TODO Make it safe, it's not good to use =raw in views
  # Highlight links in text
  def hl(text)
    text.gsub(/http:\/\/\S+/, "<a href=\"\\0\">\\0</a>")
  end

end
