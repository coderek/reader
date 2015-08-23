express = require 'express'
router = express.Router()
{errorHandler} = require './utils'

module.exports = (db)->

  router.get '/categories', (req, res)->
    db.getCategories()
      .then(res.json.bind res)
      .catch(errorHandler(res))

  router.get '/feeds', (req, res)->
    db.getFeeds()
      .then(res.json.bind res)
      .catch(errorHandler res)

  router.get '/feeds/:fid/entries', (req, res)->
    db.getEntries(req.params.fid).then(res.json.bind res).catch(errorHandler res)

  router
