module MessagesHelper

  URL_MATCHER = /((?:http|https):\/\/)?([a-z0-9]+(?:[\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(?:(?::[0-9]{1,5})?\/[^\s]*)?)/ix

  # Replace urls with 'a href' link
  def sexy(body)
    body.gsub(URL_MATCHER, link_to("http://\\2", "http://\\2", :target => "_blank"))
  end

end
