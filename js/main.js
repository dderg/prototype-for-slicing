(function() {
  requirejs.config({
    baseUrl: "../",
    paths: {
      jquery: "bower_components/jquery/dist/jquery.min"
    },
    map: {
      "*": {
        css: "bower_components/require-css/css.min"
      }
    }
  });

  require(["jquery"], function($) {});

}).call(this);
