MyElement = Polymer
  is: 'feed-list'

  created: ->
    $.get '/v1/feeds', (feeds)=>
      feedsDivs = ("<div>#{f.title}</div>" for f in feeds)
      $(this).html feedsDivs.join '' 

$ -> 
  Reader.submenu_items = [
      'alpha',
      'beta',
      'gamma',
      'delta',
      'epsilon'
  ]

  Reader.menuAction = -> console.log 'menu action'
  Reader.moreAction = -> console.log 'more action'

