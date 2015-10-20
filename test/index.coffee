# Dependencies
plainJadeify= require '../src'

Browserify= require 'browserify'

# Specs
describe 'plain-jadeify',->
  it 'only `.jade` transformation',(done)->
    chunks= []

    browserify= Browserify './test/fixtures'
    browserify.transform plainJadeify()
    .bundle()
    .on 'data',(buffer)->
      chunks.push buffer.toString()

    .on 'end',->
      expect(chunks[1]).toBe '''
        1:[function(require,module,exports){
        module.exports="<!DOCTYPE html><body ui-view><string>of jade</string></body>";
        },{}]
      '''

      expect(chunks[2]).toBe '''
        ,2:[function(require,module,exports){
        module.exports='noop'

        },{}]
      '''
      done()
