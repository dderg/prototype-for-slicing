# /*=======================================
# =              Clean task               =
# =======================================*/

# Очищает папку сгенерированных файлов

gulp   = require "gulp"
rimraf = require "rimraf"

config = require("../config").clean

gulp.task "clean", (cb) ->
  rimraf config.dest, cb
