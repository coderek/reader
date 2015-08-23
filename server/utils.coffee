exports.errorHandler = (res)->
  (err)-> res.status(500).send(err)

