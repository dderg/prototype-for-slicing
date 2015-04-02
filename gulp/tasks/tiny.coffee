# /*=======================================
# =               Tiny task               =
# =======================================*/

# Сжимает картинки

gulp    = require "gulp"
tinypng = require "gulp-tinypng"
notify  = require "gulp-notify"

config  = require("../config").tiny

gulp.task "tiny", ->
  gulp.src ["#{config.src}/**/*.jpg", "#{config.src}/**/*.png"]
    .pipe tinypng config.apikey
    .pipe gulp.dest config.dest
    .pipe notify "tiny done"