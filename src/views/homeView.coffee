###
Homepage View of Survey
###
define ["jquery",
        "underscore",
        "backbone",
        "mustache",
        "text!../templates/homeTemplate.html"],
($, _, Backbone, Mustache, template) ->
  HomeView = Backbone.View.extend(

    initialize: ->
      console.info "HomeView: View initialized"

    el: "#pageContent" #$("#pageContent")

    template: Mustache.compile(template)

    render: ->
      console.log "Render: HomeView"
      
      compiledTemplate = @template({})
      
      # Replace our compiled template to this Views "el"
      @$el.html compiledTemplate
  )
  HomeView

