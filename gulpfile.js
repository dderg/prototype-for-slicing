var gulp = require('gulp'),
    connect = require('gulp-connect'),
    styl = require('gulp-stylus'),
    jade = require('gulp-jade'),
    coffee = require('gulp-coffee'),
    uglify = require('gulp-uglify'),
    autoprefixer = require('gulp-autoprefixer')
    concat = require('gulp-concat'),
    minify = require('gulp-minify-css'),
    nib = require('nib'),
    cssBase64 = require('gulp-css-base64');

gulp.task('connect', function () {
    connect.server({
        port: 1337,
        livereload: true,
        root: './'
    });
});


gulp.task('coffee', function () {
    gulp.src('./coffee/*.coffee')
        .pipe(coffee())
        .pipe(gulp.dest('./js'));
});
gulp.task('js', function(){
    gulp.src(['bower_components/jquery/dist/jquery.js','./js/main.js'])
        .pipe(concat('all.js'))
        .pipe(uglify())
        .pipe(gulp.dest('./script'))
        .pipe(connect.reload());
});

gulp.task('styl', function () {
    gulp.src('./styl/main.styl')
        .pipe(styl({
            errLogToConsole: true,
            use: nib()
        }))
        .pipe(autoprefixer())
        .pipe(cssBase64({
            maxWeightResource: 4096
        }))
        .pipe(gulp.dest('./css'));
});
gulp.task('css', function(){
    gulp.src(['./css/normalize.css','css/pure.css','./css/main.css'])
        .pipe(concat("all.css"))
        .pipe(minify())
        .pipe(gulp.dest("./css"))
        .pipe(connect.reload());
})

gulp.task('jade',function(){
    gulp.src('./jade/*.jade')
        .pipe(jade())
        .pipe(gulp.dest('./html'))
        .pipe(connect.reload());
});



gulp.task('watch', function () {
        gulp.watch('./styl/*.styl', ['styl','css']);
        gulp.watch('./jade/*.jade', ['jade']);
        gulp.watch('./coffee/*.coffee', ['coffee','js']);
        gulp.watch(['./css/normalize.css','css/pure.css'],['css']);
});
gulp.task('default', ['styl', 'jade', 'coffee', 'js', 'css','connect', 'watch']);
