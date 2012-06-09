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
    console.log 'tried to save and got return: ', playlist.error, playlist.errors, playlist.get('errors'), playlist.get('active'), playlist.isError, playlist.get('isError')
    Empl.store.commit()
    Empl.playlistsController.set('content', Empl.store.find(Empl.Playlist))
    @close()
    return

  cancelNewPlaylist: ->
    @close()

  close: ->
    @$().modal('hide').remove()
)