Empl.NewPlaylistFormView = Ember.View.extend(

  elementId: 'playlist-form'
  classNames: ['modal']
  
  templateName: 'templates/playlists/form'

  willInsertElement: ->
    @close()      

  didInsertElement: ->
    @$().modal()

  submitNewPlaylist: (e)->
    e.preventDefault()
    playlist = Empl.store.createRecord(Empl.Playlist, {name: @get('name')})
    Empl.store.commit()
    Empl.playlistsController.set('content', Empl.store.find(Empl.Playlist))
    @close()
    return

  cancelNewPlaylist: ->
    @close()

  close: ->
    @$().modal('hide').remove()
)