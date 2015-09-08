Polymer
  is: 'entry-item'

  properties:
    title: String
    content: String

  attached: ->
    $.get "/v1/feeds/#{@feed_id}/entries/#{@entry_id}", (entry)=>
      @title = entry.title
      @id = entry.id
      @$.article.innerHTML = entry.content
