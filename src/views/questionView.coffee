###
Main Questions View

Display questions in order added to collection
###
define ["jquery",
        "underscore",
        "backbone",
        "mustache",
        "../collections/questions",
        "../views/completeView",
        "text!../templates/questionTemplate.html"],
($, _, Backbone, Mustache, Questions, CompleteView, template) ->
  QuestionView = Backbone.View.extend(

    initialize: ->
      console.info "QuestionView: View initialized"
      @questions = new Questions() # LocalStorage

    el: "#pageContent" #$("#pageContent")
    
    # Cache the template function for a single item.
    template: Mustache.compile(template)

    _currentPosition: 0 #start at page 1 (The question id's line up with the position for the purposes of this demo, but we can't guarantee this)

    render: ->
      console.log "Render: questionView"
      
      question = @questions.at(@_currentPosition)
      compiledTemplate = @template(
        questionNumber: (parseInt(@_currentPosition) + 1)#For some reason currentPosition is treated as string for some browsers "parseInt"
        question: question.escape("text")
      )
      # Replace our compiled template to this Views "el"
      @$el.html compiledTemplate

    events:
      "click #trueButton": "handleTrue"
      "click #falseButton": "handleFalse"

    handleTrue: (evt) ->
      @completeQuestion true

    handleFalse: (evt) ->
      @completeQuestion false

    completeQuestion: (selected) -> # boolean
      question = @questions.at(@_currentPosition)
      question.set "selected", selected
      question.completed()
      
      #If we are at the end of the survey move to completed
      if ++@_currentPosition < @questions.length
        window.location.href = "#/question/" + @_currentPosition
        return
      
      # Upon reaching the last question direct to the complete View
      completeView = new CompleteView()
      completeView.setResults @questions.getAnswers()
      completeView.render()
      window.location.href = "#/complete"

    setCurrentPosition: (currentPosition) ->
      @_currentPosition = currentPosition
  )

  QuestionView

