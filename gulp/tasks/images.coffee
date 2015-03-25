# /*=======================================
# =             Images task               =
# =======================================*/

# Просто копирует картинки в папку назначения

gulp   = require "gulp"

config = require("../config").images

gulp.task "images", ->
  gulp.src config.src
      .pipe gulp.dest config.dest