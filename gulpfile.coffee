gulp = require "gulp"
stylus = require "gulp-stylus"
concat = require "gulp-concat"
coffee = require "gulp-coffee"
uglify = require "gulp-uglify"
connect = require "gulp-connect"
addsrc = require "gulp-add-src"
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

gulp.task "important",  ->
  gulp.src "./styl/important.styl"
    .pipe do stylus
    .pipe do autoprefixer
    .pipe addsrc.prepend "./css/normalize.css"
    .pipe do minify
    .pipe gulp.dest "./css"
    .pipe do connect.reload

gulp.task "main", ->
  gulp.src "./styl/main.styl"
    .pipe do stylus
    .pipe do autoprefixer
    .pipe cssBase64 maxWeightResourse: 8192
    .pipe addsrc.prepend "./css/pure.css"
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
  gulp.watch './styl/main.styl', ['main']
  gulp.watch './styl/important.styl', ['important']
  gulp.watch './coffee/main.coffee', ['coffee']
  gulp.watch './jade/*.jade', ["jade"]


gulp.task "default", ["connect","jade","main","important","coffee","watch"]