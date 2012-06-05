Empl.AddToPlaylistFormView = Ember.View.extend(

  elementId: 'playlist-media-form'
  classNames: ['modal']
  mediaBinding: 'Empl.mediumsController'
  templateName: 'templates/playlists/media/form'

  willInsertElement: ->
    @close()

  didInsertElement: ->
    @$().modal()

  submitNewPlaylistMedia: (e)->
    _self = @
    e.preventDefault()
    @get('media').get('selected').forEach (item, idx, en) ->
      playlist_medium = Empl.store.createRecord Empl.PlaylistMedium,
        playlist_id: _self.get('playlist').get('id')
        medium_id: item.get('id')
      _self.get('playlist').get('playlist_media').addObject(playlist_medium)
    Empl.store.commit()
#    .refresh()
    @close()
    return

  cancelNewPlaylistMedia: ->
    @close()

  close: ->
    @$().modal('hide').remove()
)