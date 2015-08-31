/*jslint node:true */
'use strict';

// /*=======================================
// =              jshint task              =
// =======================================*/

// Линтует js-ки

var gulp   = require('gulp'),
    jshint = require('gulp-jshint'),
    config = require('../config').jshint;


gulp.task('jshint', function () {
    return gulp.src(config.src)
        .pipe(jshint({
            esnext: true,
            curly: true,
            eqeqeq: true,
            forin: true,
            freeze: true,
            maxparams: 3
        }))
        .pipe(jshint.reporter('default'));
});