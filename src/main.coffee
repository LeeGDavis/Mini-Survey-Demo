# Require.js Configuration
#   Currently using all Dev releases of products
require.config
  baseUrl: "js"
  paths:
    jquery: "libs/jquery.1.8.3-dev"
    underscore: "libs/underscore.1.4.3-dev" #"libs/lodash.underscore.1.0.0.rc3-dev",
    backbone: "libs/backbone.0.9.9-dev"
    "backbone.localStorage": "libs/backbone.localStorage.1.0.0-dev" #need the quotes because of the compound name "."
    text: "libs/require/text.2.0.3-dev"
    mustache: "libs/mustache.0.7.1-dev"

  #Non AMD libs
  shim:
    underscore: #NOTE: There is an AMD fork of this
      exports: "_"

    backbone: #NOTE: there is a AMD fork of this
      
      #backbone has a hard dependency on underscore.js (lodash is an AMD compliant alternative to underscore).
      # jquery may be needed depending on our usage namely AJAX with collections/models.
      deps: ["underscore", "jquery"]
      
      #Once loaded, use the global 'Backbone' as the module value.
      exports: "Backbone"

    "backbone.localStorage": #NOTE: There is a AMD version of this
      
      #backbone needs to be loaded before loading backbone.localStorage.js
      deps: ["backbone"]
      
      #Once loaded, use the global 'Backbone.localStorage' as the module value.
      exports: "Backbone"

require ["app"], (app) ->
  app.initialize()

