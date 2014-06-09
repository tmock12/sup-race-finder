$ ->
  ContactForm =
    $el: $("form#new_classified_message")
    submit: (e) ->
      e.preventDefault()
      @sendData $.proxy(@showSentMessage, this)
      return

    sendData: (cb) ->
      $.ajax
        url: @$el.attr("action")
        type: @$el.attr("method")
        data: @$el.serialize()
        success: $.proxy(cb, this)
        error: (xhr) ->
          ContactForm.$el.html $(xhr.responseText).filter("form").html()
          return

      return

    showSentMessage: ->
      @$el.hide().next(".sent_message").show()
      return

    init: ->
      return  unless @$el.length
      @$el.on "submit", $.proxy(@submit, this)
      return

  ContactForm.init()
