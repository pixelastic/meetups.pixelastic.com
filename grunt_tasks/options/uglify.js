/* eslint-env node */

module.exports = {
  prodAppToTmp: {
    files: {
      'tmp/js/src/app.js': [
        'app/js/steppe.js',
        'app/js/*.js'
      ]
    }
  }
};
