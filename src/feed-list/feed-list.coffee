Polymer
  is: 'feed-list'

  properties:
    feeds: Object

  created: ->
    @_refresh()

  feed_url: (feed)-> "/feeds/#{feed.id}"

  _refresh: ->
    $.get '/v1/feeds', (feeds)=> @feeds = feeds
