define ["backbone",
        "../models/question",
        "../demoData/questions",
        "backbone.localStorage"],
(Backbone, question, questionData) ->
  Questions = Backbone.Collection.extend(

    initialize: ->
      console.info "Questions: Collection initialized"
      @add questionData.questions

    model: question

    localStorage: new Backbone.LocalStorage("questions-backbone")

    completed: ->
      @filter ->
        question.get "completed"

    remaining: ->
      @without.apply this, @completed()

    #Return all the completed answers
    getAnswers: ->
      answers: @where(completed: true).map((question) ->
        id: question.get("id")
        selected: question.get("selected")
      )
  )

  Questions

