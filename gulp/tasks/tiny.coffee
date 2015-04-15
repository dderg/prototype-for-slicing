# /*=======================================
# =               Tiny task               =
# =======================================*/

# Сжимает картинки

gulp    = require "gulp"
tinypng = require "gulp-tinypng"
notify  = require "gulp-notify"
rimraf  = require "gulp-rimraf"
runSequence = require "run-sequence"

config  = require("../config").tiny

gulp.task "tiny", ->
  runSequence "compress", ["cleanTiny", "images"]

gulp.task "compress", ->
  gulp.src ["#{config.src}/**/*.jpg", "#{config.src}/**/*.png"]
    .pipe tinypng config.apikey
    .pipe gulp.dest config.dest
    .pipe notify "tiny done"

gulp.task "cleanTiny", ->
  gulp.src ["#{config.src}/**/*.jpg", "#{config.src}/**/*.png"], read: no
    .pipe do rimraf
    .pipe notify "tiny folder cleaned"
