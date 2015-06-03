/*jslint node:true */
'use strict';

// /*=======================================
// =               Watch task              =
// =======================================*/

// Следит за изменениями в файлах

var gulp   = require('gulp'),
    config = require('../config').watch;

gulp.task('watch', function () {
    gulp.watch('#{config.src}/styl/**/*.styl', ['stylus']);
    gulp.watch('#{config.src}/js/**/*.es6', ['js']);
    gulp.watch('#{config.src}/jade/**/*.jade', ['jade']);
});