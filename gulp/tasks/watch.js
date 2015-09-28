/*jslint node:true */
'use strict';

// /*=======================================
// =               Watch task              =
// =======================================*/

// Следит за изменениями в файлах

var gulp   = require('gulp');
var config = require('../config').watch;

gulp.task('watch', function () {
    gulp.watch(config.src + '/styl/**/*.styl', ['stylus']);
    gulp.watch(config.src + '/js/**/*.js', ['jshint', 'jscs']);
    gulp.watch(config.src + '/jade/**/*.jade', ['jade']);
});
