/*jslint node:true */
'use strict';

// /*=======================================
// =               Stylus task             =
// =======================================*/

// Компилирует stylus файлы
// Подключает все необходимые css файлы из bower.json
// Кодирует небольшие картинки в base64
// Подставляет вендорные префиксы

var gulp                = require('gulp');
var browserSync         = require('browser-sync');
var reload              = browserSync.reload;
var gulpif              = require('gulp-if');
var stylus              = require('gulp-stylus');
var autoprefixer        = require('gulp-autoprefixer');
var combineMq = require('gulp-combine-mq');
var addsrc              = require('gulp-add-src');
var filter              = require('gulp-filter');
var mainBowerFiles      = require('main-bower-files');
var minify              = require('gulp-minify-css');
var cssBase64           = require('gulp-css-base64');
var concat              = require('gulp-concat');
var nib                 = require('nib');
var config              = require('../config').stylus;

gulp.task('stylus', function () {
    return gulp.src(config.src)
        .pipe(stylus({use: nib}))
        .pipe(autoprefixer())
        .pipe(combineMq())
        .pipe(addsrc.prepend(mainBowerFiles()))
        .pipe(filter('*.css'))
        .pipe(cssBase64({maxWeightResource: config.base64.maxWeight}))
        .pipe(concat(config.resultName))
        .pipe(gulpif(global.production, minify({compatibility: config.minify.compatibility, noAdvanced: true})))
        .pipe(gulp.dest(config.dest))
        .pipe(reload({stream: true}));
});
