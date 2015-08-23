path = require 'path'

module.exports = (req, res, next)->
  if req.path.indexOf('bower_components') is 1
    fPath = req.path.replace '/bower_components', '../bower_components'
    fPath = path.resolve __dirname, fPath
    res.sendFile fPath
  else
    next()
