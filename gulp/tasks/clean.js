/*jslint node:true */
'use strict';

// /*=======================================
// =              Clean task               =
// =======================================*/

// Очищает папку сгенерированных файлов

var gulp   = require('gulp'),
    del    = require('del'),
    config = require('../config').clean;

gulp.task('clean', function (cb) {
    del(config.dest, cb);
});
