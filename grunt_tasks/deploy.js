'use strict';

module.exports = function(grunt) {

  grunt.registerTask('deploy', [
    'build',
    'shell:jekyllAlgolia',
    'rsync:deployToPixelastic'
  ]);

};
