gulp       = require "gulp"
requireDir = require "require-dir"
runSequence = require "run-sequence"

requireDir './gulp/tasks', { recurse: true }

gulp.task "production", ->
  global.production = true
  runSequence "clean", "build", "sftp"


gulp.task "default", ->
  runSequence "browser-sync","build","watch"