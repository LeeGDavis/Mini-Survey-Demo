// Generated by CoffeeScript 1.4.0

/*
Main Router controls URL Mappings and Views
  Usage: MyRouter.initialize()
*/


(function() {

  define(["backbone", "../views/homeView", "../views/questionView", "../views/completeView"], function(Backbone, HomeView, QuestionView, CompleteView) {
    var Router, initialize;
    Router = Backbone.Router.extend({
      initialize: function() {
        return console.info("Router: Router initialized");
      },
      routes: {
        "": "showHome",
        "question": "showQuestions",
        "question/:id": "showQuestions",
        "complete": "showComplete",
        "*actions": "defaultAction"
      },
      showHome: function() {
        if (!this.homeView) {
          this.homeView = new HomeView();
        }
        return this.homeView.render();
      },
      homeView: null,
      showQuestions: function(id) {
        if (!this.questionView) {
          this.questionView = new QuestionView();
        }
        id = id || 0;
        this.questionView.setCurrentPosition(id);
        return this.questionView.render();
      },
      questionView: null,
      showComplete: function() {
        return this.navigate("", {
          trigger: false
        });
      },
      defaultAction: function() {
        return window.location.href = "";
      }
    });
    initialize = function() {
      new Router();
      return Backbone.history.start();
    };
    return {
      initialize: initialize
    };
  });

}).call(this);