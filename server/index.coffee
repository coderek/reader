require 'coffee-script/register'
auth = require './auth'
express = require 'express'
app = express()
db = require './db'
bower = require './bower'
apiRouter = require './api'

app.use express.static('../public')
app.use bower, auth.basic

initServer = (client)->

  app.use '/v1', apiRouter(client.api)

  server = app.listen 3000, ->
    {address, port} = server.address()
    console.log "Server running at #{address}:#{port}"

db.then(initServer)
