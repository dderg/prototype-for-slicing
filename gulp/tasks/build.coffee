# /*=======================================
# =               Build task              =
# =======================================*/

# Вызывает компиляцию всех файлов поочереди

gulp        = require "gulp"
runSequence = require "run-sequence"

gulp.task "build", ->
  runSequence "fonts", "jade", "stylus", "coffee", "images"
