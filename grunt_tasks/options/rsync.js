/* eslint-env node */

module.exports = {
  options: {
    recursive: true,
    args: [
      '--archive',
      '--prune-empty-dirs'
    ]
  },

  /* DEV */
  // CSS
  devCssDependenciesToJekyll: {
    options: {
      src: 'bower_components/normalize-css/normalize.css',
      dest: 'tmp/jekyll/css'
    }
  },
  devCssDependenciesToDist: {
    options: {
      src: 'bower_components/normalize-css/normalize.css',
      dest: 'dist/css'
    }
  },
  devCssTmpToDist: {
    options: {
      src: [
        'tmp/css/src/*.css'
      ],
      dest: 'dist/css'
    }
  },
  // JS
  devJsDependenciesToJekyll: {
    options: {
      src: [
        'bower_components/algoliasearch/dist/algoliasearch.min.js',
        'bower_components/algoliasearch-helper/dist/algoliasearch.helper.min.js',
        'bower_components/hogan/web/builds/3.0.2/hogan-3.0.2.min.js',
        'bower_components/jquery/dist/jquery.min.js',
        'bower_components/moment/min/moment.min.js'
      ],
      dest: 'tmp/jekyll/js'
    }
  },
  devJsDependenciesToDist: {
    options: {
      src: [
        'bower_components/algoliasearch/dist/algoliasearch.min.js',
        'bower_components/algoliasearch-helper/dist/algoliasearch.helper.min.js',
        'bower_components/hogan/web/builds/3.0.2/hogan-3.0.2.min.js',
        'bower_components/jquery/dist/jquery.min.js',
        'bower_components/moment/min/moment.min.js'
      ],
      dest: 'dist/js'
    }
  },
  devJsAppToJekyll: {
    options: {
      src: [
        'app/js/*'
      ],
      dest: 'tmp/jekyll/js'
    }
  },
  devJsAppToDist: {
    options: {
      src: [
        'app/js/*'
      ],
      dest: 'dist/js'
    }
  },
  // HTML
  devHtmlAppToTmp: {
    options: {
      src: 'app/_layouts/',
      dest: 'tmp/html/src',
      args: [
        '--archive',
        '--recursive',
        '--delete',
        '--prune-empty-dirs',
        '--include=*/',
        '--include=*.html',
        '--exclude=*'
      ]
    }
  },
  devHtmlTmpToJekyll: {
    options: {
      src: 'tmp/html/src/',
      dest: 'tmp/jekyll/_layouts',
      args: [
        '--archive',
        '--recursive',
        '--delete',
        '--prune-empty-dirs',
        '--include=*/',
        '--include=*.html',
        '--exclude=*'
      ]
    }
  },
  // JEKYLL
  devJekyllPrepare: {
    options: {
      src: './app/*',
      dest: './tmp/jekyll',
      exclude: [
        'css/',
        'js/',
        '_layouts'
      ]
    }
  },

  /* PROD */
  // CSS
  prodCssDependenciesToTmp: {
    options: {
      src: [
        'bower_components/normalize-css/normalize.css'
      ],
      dest: 'tmp/css/src'
    }
  },
  // Js
  prodJsDependenciesToTmp: {
    options: {
      src: [
        'bower_components/algoliasearch/dist/algoliasearch.min.js',
        'bower_components/algoliasearch-helper/dist/algoliasearch.helper.min.js',
        'bower_components/hogan/web/builds/3.0.2/hogan-3.0.2.min.js',
        'bower_components/jquery/dist/jquery.min.js',
        'bower_components/moment/min/moment.min.js'
      ],
      dest: 'tmp/js/src'
    }
  },
  // HTML
  prodHtmlAppToTmp: {
    options: {
      src: 'app/_layouts/',
      dest: 'tmp/html/src',
      args: [
        '--archive',
        '--recursive',
        '--delete',
        '--prune-empty-dirs',
        '--include=*/',
        '--include=*.html',
        '--exclude=*'
      ]
    }
  },
  prodHtmlTmpToJekyll: {
    options: {
      src: 'tmp/html/src/',
      dest: 'tmp/jekyll/_layouts',
      args: [
        '--archive',
        '--recursive',
        '--delete',
        '--prune-empty-dirs',
        '--include=*/',
        '--include=*.html',
        '--exclude=*'
      ]
    }
  },
  // JEKYLL
  prodJekyllPrepare: {
    options: {
      src: './app/*',
      dest: './tmp/jekyll',
      exclude: [
        'css/',
        'js/',
        'fonts/',
        '_layouts'
      ]
    }
  },

  /* DEPLOY */
  deployToPixelastic: {
    options: {
      src: 'dist/',
      dest: 'pixelastic:/var/www/pixelastic.com/meetups.pixelastic.com/',
      args: [
        '--chmod=Du=rwx,Dg=rwx,Do=rx,Fu=rw,Fg=rw,Fo=r',
        '--verbose',
        '--archive',
        '--update',
        '--delete',
        '--prune-empty-dirs',
        '--compress'
      ]
    }
  }
};
