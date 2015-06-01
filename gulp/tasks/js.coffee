# /*=======================================
# =              Coffee task              =
# =======================================*/

# Компилирует coffeescript в JS, подключая все зависимости с помощью browserify

gulp        = require "gulp"
gulpif      = require "gulp-if"
browserify  = require "gulp-browserify"
uglify      = require "gulp-uglify"
concat      = require "gulp-concat"

browserSync = require "browser-sync"
reload      = browserSync.reload

config      = require("../config").js


gulp.task "js", (cb) ->
  gulp.src config.src, read: no
    .pipe browserify
      transform: config.transform,
      extensions: config.extensions
    .pipe concat config.destName
    .pipe gulpif global.production, do uglify
    .pipe gulp.dest config.dest
    .pipe reload stream: yes
