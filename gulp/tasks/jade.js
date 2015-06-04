/*jslint node:true */
'use strict';

// /*=======================================
// =               Jade task               =
// =======================================*/

// Компилирует Jade файлы в HTML

var gulp        = require('gulp'),
    jade        = require('gulp-jade'),
    browserSync = require('browser-sync'),
    reload      = browserSync.reload,
    config      = require('../config').jade;

gulp.task('jade', function () {
    gulp.src([config.src + '/**/*.jade', '!' + config.src + '/_**/*.jade'])
        .pipe(jade({pretty: true}))
        .pipe(gulp.dest(config.dest))
        .pipe(reload({stream: true}));
});