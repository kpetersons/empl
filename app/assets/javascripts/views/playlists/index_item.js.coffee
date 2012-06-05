Empl.PlaylistsIndexItemView = Ember.View.extend(
  tagName: 'li'
  classNames: ['']
  templateName: 'templates/playlists/index_item'
  playlistsBinding: 'Empl.playlistsController'


  selectActivePlaylist: ->
    @get('playlists').allInactive()
    @get('playlist').set('active', true)
)