/*eslint-env node*/

module.exports = {
  dev: {
    src: 'tmp/html/src/default.html',
    blocks: {
      css: {
        cwd: 'tmp/jekyll/css',
        prefix: '/css',
        src: [
          'normalize.css',
          '*.css'
        ]
      },
      js: {
        cwd: 'tmp/jekyll/js',
        prefix: '/js',
        src: [
          'lodash.min.js',
          'jquery.min.js',
          'moment.min.js',
          'hogan-3.0.2.min.js',
          'instantsearch.min.js',
          'algolia.js'
        ]
      }
    }
  },
  prod: {
    src: 'tmp/html/src/default.html',
    blocks: {
      css: {
        cwd: 'tmp/jekyll',
        prefix: '/',
        src: 'main.*.css'
      },
      js: {
        cwd: 'tmp/jekyll',
        prefix: '/',
        src: 'main.*.js'
      }
    }
  }
};
