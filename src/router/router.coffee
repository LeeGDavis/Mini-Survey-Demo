###
Main Router controls URL Mappings and Views
  Usage: MyRouter.initialize()
###
define ["backbone",
        "../views/homeView",
        "../views/questionView",
        "../views/completeView"],
(Backbone, HomeView, QuestionView, CompleteView) ->
  Router = Backbone.Router.extend(

    initialize: ->
      console.info "Router: Router initialized"

    routes:
      "":             "showHome"
      "question":     "showQuestions"
      "question/:id": "showQuestions"
      "complete":     "showComplete"
      
      # Default
      "*actions":     "defaultAction"

    showHome: ->
      @homeView = new HomeView() unless @homeView
      
      #var homeView = new HomeView();
      @homeView.render()

    homeView: null

    showQuestions: (id) ->
      @questionView = new QuestionView() unless @questionView

      id = id or 0
      @questionView.setCurrentPosition(id)
      @questionView.render()

    questionView: null

    showComplete: ->
      #Return to root, but don't trigger route
      @navigate "",
        trigger: false

    defaultAction: ->
      window.location.href = ""
  )

  initialize = ->
    new Router()
    Backbone.history.start()

  initialize: initialize

