// NOTE: This is broken because webpack does something to ES6 promises
var path = require('path');

module.exports = {
  cache: true,
  entry: {
    octokat: [
      './src/octokat.coffee',
    ]
  },
  output: {
    library: 'Octokat',
    libraryTarget: 'commonjs2',
    path: 'dist/node',
    filename: '[name].js'
  },
  module: {
    // Tell webpack to preserve the `require('xmlhttprequest')` call
    noParse: [
      /promise-filler/,
      /xmlhttprequest-filler/
    ],
    loaders: [
      { test: /\.coffee$/, loader: 'coffee-loader' }
    ]
  },
  resolve: {
    alias: {
      xmlhttprequest: path.join(__dirname, 'src/hacks/xmlhttprequest-filler-node.js'),
      'es6-promise': path.join(__dirname, 'src/hacks/promise-filler-node.js'),
    },
    extensions: ['', '.js', '.coffee']
  }
};
