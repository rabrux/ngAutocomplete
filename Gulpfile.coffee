gulp       = require 'gulp'
coffee     = require 'gulp-coffee'
less       = require 'gulp-less'
minifyCSS  = require 'gulp-minify-css'
uglify     = require 'gulp-uglify'

gulp.task 'compile', ->
  gulp.src('src/ngAutocomplete.coffee')
    .pipe(coffee())
    .pipe(uglify())
    .pipe gulp.dest('dist')

  gulp.src('src/ngAutocomplete.less')
    .pipe(less())
    .pipe(minifyCSS())
    .pipe gulp.dest('dist')