/*jslint node:true */
'use strict';

// /*=======================================
// =               jscs task               =
// =======================================*/

// проверяет на стиль js-ки
// правила берутся из .jscsrc

var gulp    = require('gulp');
var jscs    = require('gulp-jscs');
var stylish = require('gulp-jscs-stylish');
var noop    = function () {};
var config  = require('../config').jshint;

gulp.task('jscs', function () {
    return gulp.src(config.src)
        .pipe(jscs())
        .on('error', noop)
        .pipe(stylish());
});
