Empl.PlaylistMedium = DS.Model.extend

  medium_id:  DS.attr('number')
  playlist_id:  DS.attr('number')

  playlists:  DS.belongsTo('Empl.Playlist')
  medium:     DS.belongsTo('Empl.Medium')

  url: '/playlist_media'
