# /*=======================================
# =              Fonts task               =
# =======================================*/

# Шрифты для IE просто компилятся из стайлуса и сжимаются
# А для современных браузеров берется только .woff и кодируется в base64
# Сами файлы шрифтов просто копируются в папку назначения

gulp      = require "gulp"
minify 	  = require "gulp-minify-css"
cssBase64 = require "gulp-css-base64"
stylus 	  = require "gulp-stylus"

config    = require("../config").fonts

gulp.task "fonts", ->
  gulp.src "#{config.src}/fonts.styl"
    .pipe do stylus
    .pipe do cssBase64
    .pipe do minify
    .pipe gulp.dest config.cssDest
  gulp.src "#{config.src}/fonts_ie8.styl"
    .pipe do stylus
    .pipe do minify
    .pipe gulp.dest config.cssDest
  gulp.src [ "#{config.src}/*", "!#{config.src}/*.css", "!#{config.src}/*.styl" ]
    .pipe gulp.dest config.fontsDest