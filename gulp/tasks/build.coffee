# /*=======================================
# =               Build task              =
# =======================================*/

# Вызывает компиляцию всех файлов поочереди

gulp        = require "gulp"
runSequence = require "run-sequence"

gulp.task "build", (cb) ->
  runSequence "fonts", "jade", "stylus", "coffee", "images", cb
