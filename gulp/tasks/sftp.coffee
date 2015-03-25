# /*=======================================
# =               SFTP task               =
# =======================================*/

# Отправляет скомпилированные файлы на сервер

gulp   = require "gulp"
sftp   = require "gulp-sftp"

config = require("../config").sftp

gulp.task "sftp", ->
  gulp.src "dist/**/*"
    .pipe sftp config