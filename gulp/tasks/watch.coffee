gulp  = require 'gulp'
watch = require 'gulp-watch'

conf = require '../gulpconfig'





#*------------------------------------*\
#     $CSS WATCH
#*------------------------------------*/
gulp.task 'watch', ['css', 'pug', 'copy', 'browser-sync'], () ->
  gulp.watch "#{conf.path.dev.css}/**/*.scss", ['css:watch']
  gulp.watch ["#{conf.path.dev.js}/**/!(*.bundle).js", "#{conf.path.dev.js}/**/*.jsx"], ['scripts:lint']
  gulp.watch "#{conf.path.dev.app}/**/*.pug", ['pug:watch']
  gulp.watch "#{conf.path.dev.img}/raw/**/*", ['images:watch']
