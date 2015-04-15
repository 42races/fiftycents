$ ->
  $(document).on 'ajax:success', '.upvote', (e) ->
    u = $(this)
    d = $(this).parent().find('.downvote')
    u.addClass('disabled')
    d.removeClass('disabled')

  $(document).on 'ajax:success', '.downvote', (e) ->
    d = $(this)
    u = $(this).parent().find('.upvote')
    u.removeClass('disabled')
    d.addClass('disabled')
