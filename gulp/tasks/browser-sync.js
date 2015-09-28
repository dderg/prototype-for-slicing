/*jslint node:true */
'use strict';

// =======================================
// =            Browser-sync task        =
// =======================================

// Поднимает сервер и автоматически обновляет его

var gulp        = require('gulp');
var browserSync = require('browser-sync');
var config      = require('../config').browserSync;

gulp.task('browser-sync', function () {
    browserSync(config);
});
