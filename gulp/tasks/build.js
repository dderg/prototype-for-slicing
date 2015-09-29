/*jslint node:true */
'use strict';

// =========================================
// =               Build task              =
// =========================================

// Вызывает компиляцию всех файлов поочереди

var gulp        = require('gulp');
var runSequence = require('run-sequence');

gulp.task('build', function (cb) {
    return runSequence('fonts', 'jade', 'stylus', 'jshint', 'jscs', 'js', 'tiny', cb);
});
