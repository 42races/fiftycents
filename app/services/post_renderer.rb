class PostRenderer
  def render(text)
    @text = text
    link_urls
    link_usernames
    link_tags
    @text
  end

  def link_urls
    @text = Rinku.auto_link(@text)
  end

  def link_usernames
  end

  def link_tags
  end
end
