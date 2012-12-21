###
Complete View of Survery
###
define ["jquery",
        "backbone",
        "mustache",
        "text!../templates/completeTemplate.html"],
($, Backbone, Mustache, template) ->
  CompleteView = Backbone.View.extend(

    initialize: ->
      console.info "CompleteView: View initialized"

    el: "#pageContent" #$("#pageContent")
    
    # Cache the template.
    template: Mustache.compile(template)

    render: ->
      console.log "Render: CompleteView"

      compiledTemplate = @template(answers: JSON.stringify(@answers, undefined, 2))
      
      # Replace our compiled template to this Views "el"
      @$el.html compiledTemplate

    setResults: (answers) -> # property bag
      @answers = answers

    answers: null
  )

  CompleteView

