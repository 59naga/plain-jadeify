# Dependencies
through2= require 'through2'
jade= require 'jade'

# Public
plainJadeify= (file,...,options)->
  options?= {}

  transformer= (file)->
    isJade= file.slice(-5) is '.jade'

    data= ''
    through2 (buffer,encode,next)->
      return next null,buffer unless isJade

      data+= buffer
      next()

    ,(next)->
      return next() unless isJade

      options= JSON.parse JSON.stringify options
      options.filename= file
      options.doctype?= 'html'

      safeHTML= JSON.stringify jade.render data,options
      @push "module.exports=#{safeHTML};"

      next()

  unless file?
    return transformer # wait for the browserify.bundle

  else
    return transformer file # right now

module.exports= plainJadeify
