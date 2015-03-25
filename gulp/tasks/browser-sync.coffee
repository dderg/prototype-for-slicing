# /*=======================================
# =            Browser-sync task          =
# =======================================*/

# Поднимает сервер и автоматически обновляет его

gulp        = require "gulp"
browserSync = require "browser-sync"

config      = require("../config").browserSync

gulp.task "browser-sync", ->
  browserSync config
