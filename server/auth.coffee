basicAuth = require 'basic-auth'
config = require('cson').load('./config.cson')

basic = (req, res, next)->
  unauthorized = (res)->
    res.set 'WWW-Authenticate', 'Basic realm=Authorization Required'
    return res.sendStatus 401

  user = basicAuth req

  if user?.name isnt config.USERNAME and user?.pass isnt config.PASSWORD
    return unauthorized(res)

  return next()

exports.basic = basic
