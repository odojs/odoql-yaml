jsyaml = require 'js-yaml'

module.exports =
  unary:
    yaml: (exe, params) ->
      getsource = exe.build params.__s
      (cb) ->
        getsource (err, source) ->
          return cb err if err?
          try
            cb null, jsyaml.load source
          catch e
            cb e