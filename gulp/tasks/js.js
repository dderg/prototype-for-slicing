/*jslint node:true */
'use strict';

// /*=======================================
// =              Coffee task              =
// =======================================*/

// Компилирует coffeescript в JS, подключая все зависимости с помощью browserify

var gulp        = require('gulp'),
    gulpif      = require('gulp-if'),
    browserify  = require('gulp-browserify'),
    uglify      = require('gulp-uglify'),
    concat      = require('gulp-concat'),
    browserSync = require('browser-sync'),
    reload      = browserSync.reload,
    config      = require('../config').js;


gulp.task('js', function (cb) {
    gulp.src(config.src, {read: false})
        .pipe(browserify({
            transform: config.transform,
            extensions: config.extensions
        }))
        .pipe(concat(config.destName))
        .pipe(gulpif(global.production, uglify()))
        .pipe(gulp.dest(config.dest))
        .pipe(reload({stream: true}));
});