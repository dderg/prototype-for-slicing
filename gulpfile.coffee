gulp = require "gulp"
stylus = require "gulp-stylus"
concat = require "gulp-concat"
coffee = require "gulp-coffee"
uglify = require "gulp-uglify"
connect = require "gulp-connect"
minify = require "gulp-minify-css"
cssBase64 = require "gulp-css-base64"
jade = require "gulp-jade"
tinypng = require "gulp-tinypng"
autoprefixer = require "gulp-autoprefixer"
rjs = require "gulp-requirejs"
rimraf = require "rimraf"
addsrc = require "gulp-add-src"
filter = require "gulp-filter"
mainBowerFiles = require "main-bower-files"
plugins = require("gulp-load-plugins")(
    pattern: ["gulp-*","gulp.*","main-bower-files"]
    replaceString: /\bgulp[\-.]/
  )

gulp.task "tiny", ->
  gulp.src "images/**/*"
    .pipe tinypng "CrKRqfc7Q8-r-MpAro6PhQNoukdI9wh1"
    .pipe gulp.dest "images/"

gulp.task "connect", ->
  connect.server
    port: 1337
    livereload: on

gulp.task "jade", ->
  gulp.src ["jade/*.jade", "!jade/_*.jade"]
    .pipe jade pretty: on
    .pipe gulp.dest "./html"
    .pipe do connect.reload


gulp.task "stylus", ->
  gulp.src ["styl/main.styl"]
    .pipe do stylus
    .pipe do autoprefixer
    .pipe addsrc.prepend(plugins.mainBowerFiles())
    .pipe filter "*.css"
    .pipe concat "all.css"
    .pipe cssBase64 {maxWeightResource: 512}
    .pipe minify compatibility: "ie8", noAdvanced: true
    .pipe gulp.dest "./css"
    .pipe do connect.reload


gulp.task "fonts", ->
  gulp.src "./fonts/fonts.styl"
    .pipe do stylus
    .pipe do cssBase64
    .pipe do minify
    .pipe gulp.dest "./css"
  gulp.src "./fonts/fonts_ie8.styl"
    .pipe do stylus
    .pipe do minify
    .pipe gulp.dest "./css"

gulp.task "coffee", ->
  gulp.src "coffee/*.coffee"
    .pipe do coffee
    .pipe gulp.dest "build"

gulp.task "build", ["coffee"], (cb) ->
  rjs
    baseUrl: "./"
    name: "bower_components/almond/almond"
    include: ["build/main"]
    insertRequire: ["build/main"]
    out: "all.js"
    wrap: on
    findNestedDependencies: on
    paths:
      jquery: "bower_components/jquery/dist/jquery"
      slick: "bower_components/slick-carousel/slick/slick"
      headermenu: "build/headermenu"
      jquerybem: "bower_components/jquery.bem/jquery.bem"
    shim:
      jquerybem: ["jquery"]

  .pipe do uglify
  .pipe gulp.dest "js"
  .pipe do connect.reload

  rimraf "./build", cb

gulp.task 'watch', ->
  gulp.watch 'styl/*.styl', ['stylus']
  gulp.watch 'coffee/*.coffee', ['build']
  gulp.watch 'jade/*.jade', ["jade"]


gulp.task "default", ["connect","jade","stylus","build","watch"]