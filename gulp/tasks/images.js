/*jslint node:true */
'use strict';

// /*=======================================
// =             Images task               =
// =======================================*/

// Просто копирует картинки в папку назначения

var gulp   = require('gulp'),
    config = require('../config').images;

gulp.task('images', function () {
    gulp.src(config.src)
        .pipe(gulp.dest(config.dest));
});