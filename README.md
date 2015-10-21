# PlainJadeify [![NPM version][npm-image]][npm] [![Build Status][travis-image]][travis] [![Coverage Status][coveralls-image]][coveralls]

> [browserify][1] transform `.jade` to plain HTML

[1]: https://github.com/substack/node-browserify

## Installation

```bash
$ npm install browserify --global
$ npm install plain-jadeify --global
```

# CLI

[jadeify](https://github.com/domenic/jadeify) returns the __function__. But `plain-jadeify` returns a __string__.

`src/index.js`

```js
console.log(require('./index.jade'));
```

`src/index.jade`

```jade
doctype html
body(ui-view)
  string of jade
```

Ta-dah.

```bash
browserify src -t plain-jadeify > bundle.js
node bundle.js
# <!DOCTYPE html><body ui-view><string>of jade</string></body>
```

# API

## plainJadeify(options) -> transformer

`options` to pass to [jade.render](http://jade-lang.com/api/)

```js
var Browserify= require('browserify');
var plainJadeify= require('./index.js');
var fs= require('fs');

browserify= Browserify('./test/fixtures/index.js')
browserify.transform(plainJadeify({pretty:true}))
.bundle()
.pipe(fs.createWriteStream('bundle.js'),'utf8');

// (function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
// module.exports="<!DOCTYPE html>\n<body ui-view>\n  <string>of jade</string>\n</body>";
// },{}],2:[function(require,module,exports){
// require('./index.jade')
// },{"./index.jade":1}]},{},[2]);
```

License
---
[MIT][License]

[License]: http://59naga.mit-license.org/

[sauce-image]: http://soysauce.berabou.me/u/59798/plain-jadeify.svg
[sauce]: https://saucelabs.com/u/59798
[npm-image]:https://img.shields.io/npm/v/plain-jadeify.svg?style=flat-square
[npm]: https://npmjs.org/package/plain-jadeify
[travis-image]: http://img.shields.io/travis/59naga/plain-jadeify.svg?style=flat-square
[travis]: https://travis-ci.org/59naga/plain-jadeify
[coveralls-image]: http://img.shields.io/coveralls/59naga/plain-jadeify.svg?style=flat-square
[coveralls]: https://coveralls.io/r/59naga/plain-jadeify?branch=master
