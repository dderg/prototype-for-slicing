gulp = require "gulp"
stylus = require "gulp-stylus"
concat = require "gulp-concat"
coffee = require "gulp-coffee"
uglify = require "gulp-uglify"
minify = require "gulp-minify-css"
cssBase64 = require "gulp-css-base64"
jade = require "gulp-jade"
tinypng = require "gulp-tinypng"
autoprefixer = require "gulp-autoprefixer"
browserify = require "gulp-browserify"
addsrc = require "gulp-add-src"
cmq = require "gulp-combine-media-queries"
filter = require "gulp-filter"
mainBowerFiles = require "main-bower-files"
browserSync = require "browser-sync"
plugins = require("gulp-load-plugins")(
    pattern: ["gulp-*","gulp.*","main-bower-files"]
    replaceString: /\bgulp[\-.]/
  )
reload = browserSync.reload

gulp.task "tiny", ->
  gulp.src ["src/images/*"]
    .pipe filter ["*.jpg","*.png"]
    .pipe tinypng "CrKRqfc7Q8-r-MpAro6PhQNoukdI9wh1"
    .pipe gulp.dest "images"
  gulp.src ["src/images/icons/*"]
    .pipe filter ["*.jpg","*.png"]
    .pipe tinypng "CrKRqfc7Q8-r-MpAro6PhQNoukdI9wh1"
    .pipe gulp.dest "images/icons"

gulp.task "browser-sync", ->
  browserSync
    server:
      baseDir: "./"
    port: 1337
    open: false

gulp.task "jade", ->
  gulp.src ["src/jade/*.jade", "!src/jade/_*.jade"]
    .pipe jade pretty: on
    .pipe gulp.dest ""
    .pipe reload stream: yes


gulp.task "stylus", ->
  gulp.src ["src/styl/main.styl"]
    .pipe do stylus
    .pipe do autoprefixer
    # .pipe do cmq
    .pipe addsrc.prepend(mainBowerFiles())
    .pipe cssBase64 maxWeightResource: 1024
    .pipe filter "*.css"
    .pipe concat "all.css"
    # .pipe minify compatibility: "ie9", noAdvanced: true
    .pipe gulp.dest "css"
    .pipe reload stream: yes

gulp.task "fonts", ->
  gulp.src "src/fonts/fonts.styl"
    .pipe do stylus
    .pipe do cssBase64
    .pipe do minify
    .pipe gulp.dest "css"
  gulp.src "src/fonts/fonts_ie8.styl"
    .pipe do stylus
    .pipe do minify
    .pipe gulp.dest "css"
  gulp.src ["src/fonts/*","!src/fonts/*.css","!src/fonts/*.styl"]
    .pipe gulp.dest "fonts"


gulp.task "build", (cb) ->
  gulp.src "src/coffee/main.coffee", read: no
    .pipe browserify
      transform: ["coffeeify", "debowerify"]
    .pipe concat "all.js"
    # .pipe do uglify
    .pipe gulp.dest "js"
    .pipe reload stream: yes



gulp.task 'watch', ->
  gulp.watch 'src/styl/*.styl', ['stylus']
  gulp.watch 'src/coffee/*.coffee', ['build']
  gulp.watch 'src/jade/*.jade', ["jade"]


gulp.task "default", ["browser-sync","jade","stylus","build","watch"]