browserSync = require 'browser-sync'
coffeeify = require 'gulp-coffeeify'
gulp = require 'gulp'
nib = require 'nib'
stylus = require 'gulp-stylus'

reload = browserSync.reload

gulp.task 'coffee', ->
  gulp.src 'assets/coffee/app.coffee'
    .pipe coffeeify({bare: true})
    .pipe gulp.dest 'public'
    .pipe reload stream: true

gulp.task 'reload', -> reload()

gulp.task 'stylus', ->
  gulp.src 'assets/stylus/app.styl'
    .pipe stylus
      use: nib()
      compress: true
    .pipe gulp.dest 'public'
    .pipe reload stream: true

gulp.task 'server', ->
  browserSync server:
    baseDir: './'

gulp.task 'default', ['coffee', 'stylus', 'server'], ->
  gulp.watch 'assets/coffee/*.coffee', ['coffee']
  gulp.watch 'assets/stylus/*.styl', ['stylus']
  gulp.watch 'index.html', ['reload']
