module ApplicationHelper
  def h_list_tags(tags)
    return if tags.blank?
    str = ''
    tags.each do |tag|
      str += link_to tag, '#', class: 'tag'
    end
    str.html_safe
  end

  def h_profile_path(user)
    "/#{user.username || '#'}"
  end

  def h_reply_count(post)
    count = post.replies.size
    return 'Reply' if count == 0
    "#{'Reply'.pluralize(count)} (#{count})"
  end
end
