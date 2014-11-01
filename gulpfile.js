var gulp            = require("gulp");
var sass 			= require("gulp-sass");
var plumber			= require("gulp-plumber");
var autoprefixer	= require("gulp-autoprefixer");
var bg				= require("gulp-bg");
var ghpages			= require("gulp-gh-pages");
var shell 			= require("gulp-shell");

gulp.task("css", function(){
	return gulp.src("css/style.scss").
		pipe(plumber()).
		pipe(sass()).
		pipe(autoprefixer({
			browsers: ["last 2 versions"],
			cascade: false
		})).
		pipe(gulp.dest("./css"))
});

gulp.task("watch", function(){
     return gulp.watch("css/*.scss", ["css"]);
});

gulp.task("serve", bg("jekyll", "serve"));

gulp.task("start", ["serve", "watch"]);

gulp.task("publish", function(){
	return gulp.src("_site/**").
		pipe(shell("jekyll build"))
});