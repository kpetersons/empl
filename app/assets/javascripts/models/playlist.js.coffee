Empl.Playlist = DS.Model.extend

  id:       DS.attr('number')
  name:     DS.attr('string')
  user_id:  DS.attr('number')
  url: '/playlist'

  playlist_media:  DS.hasMany('Empl.PlaylistMedium')

  active:   false

  watchPlaylistMedia: (->
    console.log('Watching playlist media')
  ).observes('playlist_media.@each')