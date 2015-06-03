/*jslint node:true */
'use strict';

// /*=======================================
// =               SFTP task               =
// =======================================*/

// Отправляет скомпилированные файлы на сервер

var gulp   = require('gulp'),
    sftp   = require('gulp-sftp'),
    config = require('../config').sftp;

gulp.task('sftp', function () {
    gulp.src('dist/**/*')
        .pipe(sftp(config));
});