gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
browserSync = require('browser-sync').create()

gulp.task 'coffee', ->
  gulp.src './src/*.coffee'
    .pipe coffee(bare: true)
    .on 'error', gutil.log
    .pipe gulp.dest('./public/')
  
gulp.task 'serve', ['coffee'], ->
  browserSync.init server: '.'
  gulp.watch './src/*.coffee', ['coffee']
  gulp.watch(['./*.html', './src/*.coffee']).on 'change', browserSync.reload

gulp.task 'default', ['serve']
  
