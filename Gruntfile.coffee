'use strict'

module.exports = (grunt) ->
  # measures the time each task takes
  require('time-grunt')(grunt)

  grunt.initConfig
    less:
      dev:
        options:
          paths: [ '/' ]
        src: [ 'email/src/css/styles.less' ]
        dest: 'email/dest/css/styles.css'
    autoprefixer:
      dev:
        options:
          browsers: [ '> 0.1%', 'last 10 versions', 'ie 6', 'ie 7', 'ie 8', 'ie 9']
          diff: true
        src: [ 'email/dest/css/styles.css' ]
    watch:
      css:
        files: [ 'email/src/css/*' ]
        tasks: [ 'default' ]


  require('load-grunt-tasks')(grunt)

  grunt.registerTask 'default', [ 'less', 'autoprefixer' ]
