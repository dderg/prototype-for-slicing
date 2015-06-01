# /*=======================================
# =               Tiny task               =
# =======================================*/

# Сжимает картинки

gulp    = require "gulp"
tinypng = require "gulp-tinypng"
del  = require "del"
runSequence = require "run-sequence"

config  = require("../config").tiny

gulp.task "tiny", ->
  runSequence "compress", ["cleanTiny", "images"]

gulp.task "compress", ->
  gulp.src ["#{config.src}/**/*.jpg", "#{config.src}/**/*.png"]
    .pipe tinypng config.apikey
    .pipe gulp.dest config.dest
   
gulp.task "cleanTiny", (cb) ->
  del ["#{config.src}/**/*.jpg", "#{config.src}/**/*.png"], cb