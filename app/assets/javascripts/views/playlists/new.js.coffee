Empl.NewPlaylistView = Ember.View.extend(

  tagName: 'li'
  templateName: 'templates/playlists/new'


  newPlaylist: ->
    Empl.NewPlaylistFormView.create().appendTo('body')
)