Empl.Medium = DS.Model.extend

  id:                   DS.attr('number')
  medium_file_name:     DS.attr('string')
  medium_content_type:  DS.attr('string')
  medium_file_size:     DS.attr('number')
  medium_file_url:      DS.attr('string')

  playlist_medias:  DS.hasMany('Empl.PlaylistMedium')
  medium_infos:     DS.hasMany('Empl.MediumInfo')

  url: '/media'

  selected: false
  playing:  false
  paused:   false
  showing:  true
  filtered: false

  isPlayable: ( ->
    !@get('playing') && !@get('showing')
  ).property('playing', 'showing')

  isPlaying: ( ->
    !@get('playing').length > 1
  ).property('playing')

  nowPlaying: (->
    tmp = @get('content').filterProperty('playing', true)
    if tmp.length > 0
      return tmp[0]
    return null
  ).property('playing')

  setState: (state)->
    if state == 'playing'
      @set('playing', true)
      @set('paused', false)
      @set('ended', false)
    if state == 'paused'
      @set('playing', false)
      @set('paused', true)
      @set('ended', false)
    if state == 'ended'
      @set('playing', false)
      @set('paused', false)
      @set('ended', true)

  watchPlaylist: (->
    @set('selected', false)
  ).observes('Empl.playlistsController.activePlaylist')

#  Media information
  isMissingInfo: (->
    @get('medium_infos').content.length < 1
  ).property()

  title: (->
    if @get('isMissingInfo')
      return @get('medium_file_name')
    val = @attr('title')
    if val
      val.get('attr_value')
  ).property('medium_infos.@each.attr_key')

  artist: (->
    val = @attr('artist')
    if val
      val.get('attr_value')
  ).property('medium_infos.@each.attr_key')

  album: (->
    val = @attr('album')
    if val
      val.get('attr_value')
  ).property('medium_infos.@each.attr_key')

  track_number: (->
    val = @attr('track_number')
    if val
      val.get('attr_value')
  ).property('medium_infos.@each.attr_key')

  attr: ((name)->
    @get('medium_infos').findProperty('attr_key', name)
  )

Empl.MediumInfo = DS.Model.extend

  attr_key:     DS.attr('string')
  attr_value:   DS.attr('string')

  medium:       DS.belongsTo('Empl.Medium')

  url: '/media_info'