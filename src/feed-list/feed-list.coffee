Polymer
  is: 'feed-list'

  properties:
    feeds: Object

  created: ->
    @_refresh()

  _refresh: ->
    $.get '/v1/feeds', (feeds)=> @feeds = feeds
