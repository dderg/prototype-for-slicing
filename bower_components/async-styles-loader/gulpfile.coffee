gulp = require "gulp"
uglify = require "gulp-uglify"
coffee = require "gulp-coffee"
rename = require "gulp-rename"

gulp.task "build", ->
  gulp.src "./async-style.coffee"
    .pipe coffee bare: on
    .pipe do uglify
    .pipe rename extname: ".min.js"
    .pipe gulp.dest "./"

gulp.task "watch", ->
  gulp.watch "./async-style.coffee", ["build"]

gulp.task "default", ["build","watch"]