gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
browserSync = require('browser-sync').create()

gulp.task 'coffee', ->
  gulp.src './src/*.coffee'
    .pipe coffee(bare: true)
    .on 'error', gutil.log
    .pipe gulp.dest('./public/')

gulp.task 'copy_assets', ->
  gulp.src 'src/*.html'
    .pipe gulp.dest './public/'

gulp.task 'build', ['coffee', 'copy_assets']

gulp.task 'serve', ['build'], ->
  gulp.watch ['./src/*.html', './src/*.coffee'], ['build']

gulp.task 'default', ['serve']
