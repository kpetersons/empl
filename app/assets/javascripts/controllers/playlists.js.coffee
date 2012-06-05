Empl.playlistsController = Ember.ArrayController.create(

  activePlaylist: (->
    rs = @get('content').filterProperty('active')
    if rs.length > 0
      return rs[0]
  ).property('content.@each.active')

  observeActivePlaylist: (->
    if @get('activePlaylist')
      Empl.mediumsController.hideAll()
      @get('activePlaylist').get('playlist_media').forEach (item, idx, en) ->
        Empl.mediumsController.get('content').filterProperty('id', item.get('medium_id')).forEach (item, idx, en) ->
          item.set('showing', true)
  ).observes('activePlaylist')

  allInactive: ->
    @get('content').forEach (item, idx, en) ->
      item.set('active', false)



)
