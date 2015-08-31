/*jslint node:true */
'use strict';

// /*=======================================
// =               jscs task               =
// =======================================*/

// проверяет на стиль js-ки
// правила берутся из .jscsrc

var gulp    = require('gulp'),
    jscs    = require('gulp-jscs'),
    stylish = require('gulp-jscs-stylish'),
    noop    = function () {},
    config  = require('../config').jshint;


gulp.task('jscs', function () {
    return gulp.src(config.src)
        .pipe(jscs())
        .on('error', noop)
        .pipe(stylish());
});