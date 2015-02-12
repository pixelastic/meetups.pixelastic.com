'use strict';

module.exports = function(grunt) {
  grunt.registerTask(
    'compile',
    'Compile the website to be served locally', [
      'mkdir:dev',
      // CSS
      'rsync:devCssDependenciesToJekyll',
      'sass:devAppToTmp',
      'autoprefixer:devTmpToJekyll',
      // JS
      'rsync:devJsDependenciesToJekyll',
      'rsync:devJsAppToJekyll',
      // HTML
      'rsync:devHtmlAppToTmp',
      'fileblocks:dev',
      'rsync:devHtmlTmpToJekyll',
      // JEKYLL
      'rsync:devJekyllPrepare',
      'jekyll:dev'
    ]);
};
