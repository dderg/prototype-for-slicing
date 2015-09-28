/*jslint node:true */
'use strict';

// /*=======================================
// =               SFTP task               =
// =======================================*/

// Отправляет скомпилированные файлы на сервер

var gulp   = require('gulp');
var sftp   = require('gulp-sftp');
var config = require('../config').sftp;

gulp.task('sftp', function () {
    return gulp.src('dist/**/*')
        .pipe(sftp(config));
});
