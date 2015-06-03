/*jslint node:true */
'use strict';
var gulp        = require('gulp'),
    requireDir  = require('require-dir'),
    runSequence = require('run-sequence');

requireDir('./gulp/tasks', { recurse: true });

gulp.task('release', function () {
	global.production = true;
	runSequence('build', 'sftp');
});


gulp.task('default', function () {
	runSequence('browser-sync', 'build', 'watch');
});