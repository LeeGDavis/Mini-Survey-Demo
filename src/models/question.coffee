define ["backbone"], (Backbone) ->
  Question = Backbone.Model.extend(
    initialize: ->
      console.info "Question: Model initialized"

    defaults:
      text: ""
      selected: false
      completed: false

    completed: ->
      @save completed: true
  )

  Question

