/*jslint node:true */
'use strict';

// /*=======================================
// =              Fonts task               =
// =======================================*/

// Шрифты для IE просто компилятся из стайлуса и сжимаются
// А для современных браузеров берется только .woff и кодируется в base64
// Сами файлы шрифтов просто копируются в папку назначения

var gulp      = require('gulp'),
    minify    = require('gulp-minify-css'),
    cssBase64 = require('gulp-css-base64'),
    stylus    = require('gulp-stylus'),
    config    = require('../config').fonts;

gulp.task('fonts', function () {
    gulp.src(config.src + '/fonts.styl')
        .pipe(stylus())
        .pipe(cssBase64())
        .pipe(minify())
        .pipe(gulp.dest(config.cssDest));

    gulp.src(config.src + '/fonts_ie8.styl')
        .pipe(stylus())
        .pipe(minify())
        .pipe(gulp.dest(config.cssDest));
    
    gulp.src([config.src + '/*', '!' + config.src + '/*.css', '!' + config.src + '/*.styl'])
        .pipe(gulp.dest(config.fontsDest));
});