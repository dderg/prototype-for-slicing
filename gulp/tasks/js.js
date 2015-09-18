/*jslint node:true */
'use strict';

// /*=======================================
// =                JS task                =
// =======================================*/

// Компилирует ES2015 в ES5, подключая все зависимости с помощью browserify

var gulp        = require('gulp'),
    gulpif      = require('gulp-if'),
    watchify    = require('watchify'),
    assign      = require('lodash.assign'),
    browserify  = require('browserify'),
    uglify      = require('gulp-uglify'),
    concat      = require('gulp-concat'),
    browserSync = require('browser-sync'),
    buffer      = require('vinyl-buffer'),
    source      = require('vinyl-source-stream'),
    babelify    = require('babelify'),
    gutil       = require('gulp-util'),
    reload      = browserSync.reload,
    config      = require('../config').js;


var customOpts = {
    entries: [config.src],
    debug: true,
    transform: [babelify],
    extensions: ['.js']
};
var b;
if (global.production) {
    b = browserify(customOpts);
} else {
    var opts = assign({}, watchify.args, customOpts);
    b = watchify(browserify(opts)); 
}

// add transformations here
// i.e. b.transform(coffeeify);

gulp.task('js', bundle); // so you can run `gulp js` to build the file
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
