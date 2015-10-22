/*jslint node:true */
'use strict';
var gulp        = require('gulp');
var requireDir  = require('require-dir');
var runSequence = require('run-sequence');

requireDir('./gulp/tasks', {recurse: true});

gulp.task('release', function () {
    global.production = true;
    runSequence('build', 'sftp');
});

gulp.task('default', function () {
    global.production = true;
    runSequence('build', 'watch');
});

gulp.task('compile', function () {
    global.production = true;
    runSequence('build');
});

gulp.task('serve', function () {
    runSequence('browser-sync', 'build', 'watch');
});
