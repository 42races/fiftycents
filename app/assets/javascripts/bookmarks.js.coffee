$ ->
  $(document).on 'ajax:success', '.bookmark', (e, data) ->
    el = $(this)

    if data.status
      el.toggleClass('on')
      verb = el.attr('data-method')
      verb = (verb == 'post') ? 'delete' : 'post'
      el.attr('data-method', verb)
    else
      console.log(data.message)
