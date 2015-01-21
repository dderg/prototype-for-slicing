gulp = require "gulp"
stylus = require "gulp-stylus"
concat = require "gulp-concat"
coffee = require "gulp-coffee"
uglify = require "gulp-uglify"
connect = require "gulp-connect"
minify = require "gulp-minify-css"
cssBase64 = require "gulp-css-base64"
jade = require "gulp-jade"
autoprefixer = require "gulp-autoprefixer"

gulp.task "connect", ->
  connect.server
    port: 1337
    livereload: on
    root: "./"

gulp.task "jade", ->
  gulp.src "./jade/*.jade"
    .pipe jade pretty: on
    .pipe gulp.dest "./html"
    .pipe do connect.reload

gulp.task "styl", ["css"], ->
  gulp.src "./styl/*.styl"
    .pipe do stylus
    .pipe do autoprefixer
    .pipe cssBase64 maxWeightResourse: 8192
    .pipe gulp.dest "./css"

gulp.task "css", ->
  gulp.src ['./css/normalize.css','./css/important.css']
      .pipe concat "imp.css"
      .pipe do minify
      .pipe gulp.dest "./css"
      .pipe do connect.reload
  gulp.src ['./css/pure.css','./css/main.css']
      .pipe concat "all.css"
      .pipe do minify
      .pipe gulp.dest "./css"
      .pipe do connect.reload


gulp.task "coffee", ["js"], ->
  gulp.src "./coffee/main.coffee"
    .pipe do coffee
    .pipe gulp.dest "./js"

gulp.task "js", ->
  gulp.src ["./js/main.js"]
    .pipe concat "all.js"
    .pipe do uglify
    .pipe gulp.dest "./js"
    .pipe do connect.reload




gulp.task 'watch', ->
  gulp.watch './styl/*.styl', ['styl']
  gulp.watch './coffee/main.coffee', ['coffee']
  gulp.watch './jade/*.jade', ["jade"]


gulp.task "default", ["connect","jade","css","coffee","watch"]