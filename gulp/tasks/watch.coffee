# /*=======================================
# =               Watch task              =
# =======================================*/

# Следит за изменениями в файлах

gulp   = require "gulp"

config = require("../config").watch

gulp.task 'watch', ->
  gulp.watch "#{config.src}/styl/**/*.styl", ['stylus']
  gulp.watch "#{config.src}/js/**/*.js", ['js']
  gulp.watch "#{config.src}/jade/**/*.jade", ['jade']