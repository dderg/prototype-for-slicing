# /*=======================================
# =             Images task               =
# =======================================*/

# Просто копирует картинки в папку назначения

gulp   = require "gulp"
notify = require "gulp-notify"

config = require("../config").images

gulp.task "images", ->
  gulp.src config.src
      .pipe gulp.dest config.dest
      .pipe notify "images done"