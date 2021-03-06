URL_VALIDATOR = require '../grammar/url-validator'

module.exports = new class PathValidator
  requestMiddlewareAsync: (input, cb) ->
    {path} = input
    unless URL_VALIDATOR.test(path)
      err = "Octokat BUG: Invalid Path. If this is actually a valid path then please update the URL_VALIDATOR. path=#{path}"
      console.warn(err)
    cb(null, input)
