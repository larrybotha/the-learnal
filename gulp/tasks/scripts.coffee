gulp        = require 'gulp'
assign      = require 'object.assign'
eslint      = require 'gulp-eslint'
webpack     = require 'webpack'

path        = require('../gulpconfig').path

runWebPack = (config, done) ->
  webpack(config).run (err, stats) ->
    if err
      console.log 'Error', err
    else
      console.log stats.toString({ chunks: false })

    done()





#*------------------------------------*\
#     $SCRIPTS
#*------------------------------------*/
gulp.task 'scripts:minify', (done) ->
  webpackConf = require '../../webpack.config.prod'

  runWebPack(webpackConf, done)





#*------------------------------------*\
#     $SCRIPTS WATCH
#*------------------------------------*/
gulp.task 'scripts:watch', ['scripts'],  () ->
  global.browserSync.reload()





#*------------------------------------*\
#     $SCRIPTS VENDORS
#*------------------------------------*/
gulp.task 'scripts:vendors', (done) ->
  # files = [
  #   "#{path.dev.js}/vendor.js"
  # ]

  # runWebPack(entries, {}, done)
  #





#*------------------------------------*\
#     $LINT
#*------------------------------------*/
gulp.task 'scripts:lint',  () ->
  files = [
    "#{path.dev.js}/**/*.js"
    "#{path.dev.js}/**/*.jsx"
  ]

  gulp.src(files)
    .pipe(eslint())
    .pipe(eslint.format())

