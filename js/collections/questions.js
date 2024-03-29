// Generated by CoffeeScript 1.4.0
(function() {

  define(["backbone", "../models/question", "../demoData/questions", "backbone.localStorage"], function(Backbone, question, questionData) {
    var Questions;
    Questions = Backbone.Collection.extend({
      initialize: function() {
        console.info("Questions: Collection initialized");
        return this.add(questionData.questions);
      },
      model: question,
      localStorage: new Backbone.LocalStorage("questions-backbone"),
      completed: function() {
        return this.filter(function() {
          return question.get("completed");
        });
      },
      remaining: function() {
        return this.without.apply(this, this.completed());
      },
      getAnswers: function() {
        return {
          answers: this.where({
            completed: true
          }).map(function(question) {
            return {
              id: question.get("id"),
              selected: question.get("selected")
            };
          })
        };
      }
    });
    return Questions;
  });

}).call(this);
