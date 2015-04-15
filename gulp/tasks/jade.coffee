# /*=======================================
# =               Jade task               =
# =======================================*/

# Компилирует Jade файлы в HTML

gulp        = require "gulp"
jade        = require "gulp-jade"

browserSync = require "browser-sync"
reload      = browserSync.reload

config      = require("../config").jade

gulp.task "jade", ->
  gulp.src ["#{config.src}/*.jade", "!#{config.src}/_*.jade"]
    .pipe jade pretty: on
    .pipe gulp.dest config.dest
    .pipe reload stream: yes