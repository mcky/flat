module.exports = function (grunt) {

    require('load-grunt-tasks')(grunt, ['grunt-*']);
    
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        watch: {
            files: ['./app/assets/stylesheets/*.scss', './app/assets/stylesheets/*/*.scss', 'app/**/*.html.erb'],
//            files: ['<% sass.dev.src %>'],
            tasks: ['sass:dev']
        },
        
        sass: { 
            dist: {
                options: {
//                    style: 'compressed',
                },
                expand: true,
                cwd: './app/assets/stylesheets/',
                src: ['*.scss'],
                dest: './app/assets/stylesheets/',
                ext: '.css'
            },
            dev: {
                options: {
                    style: 'expanded',
                    debugInfo: false,
                    lineNumbers: false,
                },
                expand: true,
                cwd: './app/assets/stylesheets/',
                src: ['application.scss'],
                dest: './app/assets/stylesheets/',
                ext: '.css'
            }
        },
        
        browser_sync: {
            files: {
                src : ['./app/assets/stylesheets/*.css', './app/**/*.html.erb'],
            },
            options: {
                watchTask: true,
                proxy: {
//                    host: "0.0.0.0",
                    host: "flat.dev",
//                    port: 3000
                },
                ghostMode: {
                    scroll: true,
                    links: true,
                    forms: true
                }
            },
        },

        
//        uglify: {
//            options: {
//                mangle: false,
//                report: 'min',
//                banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' + '<%= grunt.template.today("yyyy-mm-dd") %> */\n'
//            },
//            dist: {
//                files: {
//                    './dist/js/modernizr.min.js': ['./app/js/modernizr.js'],
//                    './dist/js/app.min.js': ['./app/js/jquery.js', './app/js/ajaxchimp.js', './app/js/functions.js']
//                }
//            }
//        },
        
//        uncss: {
//            dist: {
//                files: {
//                    'dist/styles/style.css': ['./dist/index.html']
//                },
//                options: {
//                    compress:true,
//                    ignore: [
//                        '.mc-error-msg--active', // functions.js
//                        '.error', // ajaxchimp.js
//                        '.valid' // ajaxchimp.js
//                        ]
//                }
//            }
//        },

        
    });
    grunt.registerTask('default', ['browser_sync', 'watch']);
    
//    grunt.registerTask('dist', ['sass:dist', 'uncss']);
    grunt.registerTask('dist', ['clean:dist', 'processhtml:dist', 'sass:dist', 'uglify:dist', 'uncss:dist', 'htmlmin']);
};