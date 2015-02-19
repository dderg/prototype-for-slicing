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

gulp.task "tiny", ->
  gulp.src "./images/*"
    .pipe tinypng "CrKRqfc7Q8-r-MpAro6PhQNoukdI9wh1"
    .pipe gulp.dest "./images/"

gulp.task "connect", ->
  connect.server
    port: 1337
    livereload: on

gulp.task "jade", ->
  gulp.src "./jade/*.jade"
    .pipe jade pretty: on
    .pipe gulp.dest "./html"
    .pipe do connect.reload


gulp.task "main", ->
  gulp.src ["./styl/*.styl","!./styl/_*.styl"]
    .pipe do stylus
    .pipe do autoprefixer
    .pipe cssBase64 maxWeightResourse: 8192
    #.pipe do minify
    .pipe gulp.dest "./css"
    .pipe do connect.reload


gulp.task "coffee", ->
  gulp.src "./coffee/*.coffee"
    .pipe do coffee
    #.pipe do uglify
    .pipe gulp.dest "./js"
    .pipe do connect.reload

gulp.task 'watch', ->
  gulp.watch './styl/*.styl', ['main']
  gulp.watch './coffee/*.coffee', ['coffee']
  gulp.watch './jade/*.jade', ["jade"]


gulp.task "default", ["connect","jade","main","coffee","watch"]