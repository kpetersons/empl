Empl.PlaylistsIndexView = Ember.View.extend

  tagName: 'ul'
  classNames: ['unstyled']
  templateName: 'templates/playlists/index'
  playlistsBinding: 'Empl.playlistsController'