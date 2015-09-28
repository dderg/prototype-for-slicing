/*jslint node:true */
'use strict';

// /*=======================================
// =             Images task               =
// =======================================*/

// Просто копирует картинки в папку назначения

var gulp   = require('gulp');
var config = require('../config').images;

gulp.task('images', function () {
    return gulp.src(config.src)
        .pipe(gulp.dest(config.dest));
});
