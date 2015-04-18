$ ->
  $(document).on 'ajax:success', '.add-bookmark', (e, data) ->
    el = $(this)

    if data.status
      t = h.template('bookmarks/remove', data)
      el.replaceWith(t)
    else
      console.log(data.message)

  $(document).on 'ajax:success', '.remove-bookmark', (e, data) ->
    el = $(this)

    if data.status
      t = h.template('bookmarks/add', data)
      el.replaceWith(t)
    else
      console.log(data.message)
