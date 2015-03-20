module ApplicationHelper
  def h_list_tags(tags)
    str = ''
    tags.each do |tag|
      str += link_to tag, '#', class: 'tag'
    end
    str.html_safe
  end
end
