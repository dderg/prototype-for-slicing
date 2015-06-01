# /*=======================================
# =              Clean task               =
# =======================================*/

# Очищает папку сгенерированных файлов

gulp   = require "gulp"
del = require "del"

config = require("../config").clean

gulp.task "clean", (cb) ->
  del config.dest, cb
