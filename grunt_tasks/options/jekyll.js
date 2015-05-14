/* eslint-env node */
/* eslint camelcase: [2, {"properties": "never"}] */
/* jshint camelcase: false */

module.exports = {
  options: {
    config: '_config.yml'
  },
  dev: {
    options: {
      src: 'tmp/jekyll',
      dest: 'dist/',
      drafts: true,
      limit_posts: 30
    }
  },
  prod: {
    options: {
      src: 'tmp/jekyll',
      dest: 'dist/'
    }
  }
};
