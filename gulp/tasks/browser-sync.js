/*jslint node:true */
'use strict';

// =======================================
// =            Browser-sync task        =
// =======================================

// Поднимает сервер и автоматически обновляет его

var gulp        = require('gulp'),
	browserSync = require('browser-sync'),
	config      = require('../config').browserSync;

gulp.task('browser-sync', function () {
	browserSync(config);
});
