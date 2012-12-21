###
<**** NOT USED - Currently generated straight from questions Collection****>
###
define ["backbone"], (Backbone) ->
  Answer = new Backbone.Model.extend(

    initialize: ->
      console.info "Answer: Model initialized"

    defaults:
      selected: false
  )

  Answer

