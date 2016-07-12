const gulp     = require('gulp');
const favicons = require('gulp-favicons');
const gutil    = require('gulp-util');
const imagemin = require('gulp-imagemin');
const pngquant = require('imagemin-pngquant');





//*------------------------------------*\
//     $FAVICONS
//*------------------------------------*/
gulp.task('favicons', () =>
  gulp.src('./src/device-icon-template.png')
    .pipe(favicons({
      background: "#fff",
      display: "browser",
      orientation: "portrait",
      logging: true,
      icons: {
        android: true,
        appleIcon: true,
        appleStartup: false,
        coast: false,
        favicons: false, // use x-icon editor for multilayered favicons
        firefox: true,
        opengraph: true,
        twitter: true,
        windows: true,
        yandex: false
      }
      }).on('error', gutil.log))
    .pipe(imagemin({
      optimizationLevel: 3,
      progressive: true,
      interlaced: true,
      use: [pngquant()]
    }))
    .pipe(gulp.dest("./src"))
);
