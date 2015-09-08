Promise = require 'bluebird'
pg = require 'pg'
conStr = 'postgres://derekzeng:@localhost/reader_dev'

getCollection = (client, done, table, foreignKey)->
  q = "select * from #{table}"

  if foreignKey
    q = "#{q} where #{foreignKey.field} = #{foreignKey.value}"

  p = (resolve, reject)->
    client.query q, (err, result)->
      if err
        reject(err)
      else 
        resolve(result.rows)

  new Promise(p)

getModel = (client, done, table, id)->

  q = "select * from #{table} where id = #{id}"

  p = (resolve, reject)->
    client.query q, (err, result)->
      if err
        reject err
      else
        resolve result.rows

  new Promise(p)

p = (resolve, reject)->
  pg.connect conStr, (err, client, done)->
    if err
      reject(err)

    client.api =
      getCategories: ()-> getCollection(client, done, 'categories')
      getFeeds: ()-> getCollection(client, done, 'feeds')
      getEntries: (fid)-> getCollection(client, done, 'entries', {field: 'feed_id', value: fid})
      getEntry: (eid)-> getModel(client, done, 'entries', eid).then((rows)-> if rows.length then rows[0] else throw 404)

    resolve(client)

module.exports = new Promise(p)
