gulp       = require "gulp"
requireDir = require "require-dir"
runSequence = require "run-sequence"

requireDir './gulp/tasks', { recurse: true }

gulp.task "release", ->
  global.production = true
  runSequence "build", "sftp"


gulp.task "default", ->
  runSequence "browser-sync","build","watch"