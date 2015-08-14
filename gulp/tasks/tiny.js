/*jslint node:true */
'use strict';

// /*=======================================
// =               Tiny task               =
// =======================================*/

// Сжимает картинки

var gulp        = require('gulp'),
    tinypng     = require('gulp-tinypng'),
    del         = require('del'),
    runSequence = require('run-sequence'),
    config      = require('../config').tiny;

gulp.task('tiny', function () {
    return runSequence('compress', ['cleanTiny', 'images']);
});

gulp.task('compress', function () {
    return gulp.src([config.src + '/**/*.jpg', config.src + '/**/*.png'])
        .pipe(tinypng(config.apikey))
        .pipe(gulp.dest(config.dest));
});
   
gulp.task('cleanTiny', function (cb) {
    return del([config.src + '/**/*.jpg', config.src + '/**/*.png'], cb);
});