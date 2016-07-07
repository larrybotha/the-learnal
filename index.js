const Metalsmith  = require('metalsmith');
const markdown    = require('metalsmith-markdown');
const layouts     = require('metalsmith-layouts');
const permalinks  = require('metalsmith-permalinks');

Metalsmith(__dirname)
  .clean(true)
  .use(markdown())
  .use(layouts({
    engine: 'pug',
    directory: 'layouts',
    partials: 'partials'
  }))
  .destination('./build')
  .build(function(err, files) {
    if (err) { throw err; }
  });
