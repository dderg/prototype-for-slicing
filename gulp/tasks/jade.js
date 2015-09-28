/*jslint node:true */
'use strict';

// /*=======================================
// =               Jade task               =
// =======================================*/

// Компилирует Jade файлы в HTML

var gulp        = require('gulp');
var jade        = require('gulp-jade');
var browserSync = require('browser-sync');
var reload      = browserSync.reload;
var config      = require('../config').jade;

gulp.task('jade', function () {
    return gulp.src([config.src + '/**/*.jade', '!' + config.src + '/_**/*.jade'])
        .pipe(jade({pretty: true}))
        .pipe(gulp.dest(config.dest))
        .pipe(reload({stream: true}));
});
