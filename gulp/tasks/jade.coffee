# /*=======================================
# =               Jade task               =
# =======================================*/

# Компилирует Jade файлы в HTML

gulp        = require "gulp"
jade        = require "gulp-jade"
notify      = require "gulp-notify"

browserSync = require "browser-sync"
reload      = browserSync.reload

config      = require("../config").jade

gulp.task "jade", ->
  gulp.src ["#{config.src}/*.jade", "!#{config.src}/_*.jade"]
    .pipe notify "jade start"
    .pipe jade pretty: on
    .pipe gulp.dest config.dest
    .pipe reload stream: yes
    .pipe notify "jade done"