/*jslint node:true */
'use strict';

// /*=======================================
// =                JS task                =
// =======================================*/

// Компилирует ES2015 в ES5, подключая все зависимости с помощью browserify

var gulp        = require('gulp');
var gulpif      = require('gulp-if');
var watchify    = require('watchify');
var assign      = require('lodash.assign');
var browserify  = require('browserify');
var uglify      = require('gulp-uglify');
var concat      = require('gulp-concat');
var browserSync = require('browser-sync');
var buffer      = require('vinyl-buffer');
var source      = require('vinyl-source-stream');
var babelify    = require('babelify');
var gutil       = require('gulp-util');
var reload      = browserSync.reload;
var config      = require('../config').js;

var customOpts = {
    entries: [config.src],
    debug: true,
    transform: [babelify],
    extensions: ['.js']
};
var b;

gulp.task('js', function () {
    if (global.production) {
        b = browserify(customOpts);
    } else {
        var opts = assign({}, watchify.args, customOpts);
        b = watchify(browserify(opts));
    }

    // add transformations here
    // i.e. b.transform(coffeeify);

    b.on('update', bundle); // on any dep update, runs the bundler
    b.on('log', gutil.log); // output build logs to terminal

    function bundle() {
        return b.bundle()
            // log errors if they happen
            .on('error', gutil.log.bind(gutil, 'Browserify Error'))
            .pipe(source(config.destName))
            .pipe(buffer())
            .pipe(gulpif(global.production, uglify()))
            .pipe(gulp.dest(config.dest))
            .pipe(reload({stream:true}));
    }
    bundle();
});
