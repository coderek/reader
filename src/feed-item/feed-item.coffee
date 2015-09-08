Polymer
  is: 'feed-item'

  properties:
    feed: Object
    entries: Array
    feed_id: Number

  attached: ->
    $.get "/v1/feeds/#{@feed_id}/entries", (entries)=>
      @entries = entries
  
  entry_url: (entry)-> "/feeds/#{entry.feed_id}/entries/#{entry.id}"





