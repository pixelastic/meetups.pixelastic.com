/* eslint-env node */

module.exports = function(grunt) {

  grunt.registerTask('deploy', [
    'build',
    'shell:jekyllAlgolia',
    'rsync:deployToPixelastic'
  ]);

};
