Empl.PlayerControlsView = Ember.View.extend(

  templateName: 'templates/player/player_controls'

  areControlsDisabled: (->
    !@get('media').get('isSelected')
  ).property('media.isSelected')

  isPlaying:(->
    return @get('media').get('isPlaying')
  ).property('media.isPlaying')

  canNotStepForward: ( ->
    return @get('canNotPause')
  ).property('canNotPause')

  canNotStepBackward: ( ->
    return @get('canNotPause')
  ).property('canNotPause')

  canNotPlay: ( ->
    @get('media').get('isPlaying') || !@get('media').get('isSelected')
  ).property('media.isPlaying', 'media.isSelected')

  canNotStopPlay: (->
    !@get('media').get('isPlaying')
  ).property('media.isPlaying')

  canNotPause: ( ->
    !@get('media').get('isPlaying')
  ).property('media.isPlaying', 'media.isSelected')

  newAddToPlaylist: ->
    Empl.AddToPlaylistFormView.create().appendTo('body')

  stopPlayMedia: ->
    @togglePlay()
    @get('media').clearFlagForAll('playing')
    @set('medium', null)

  playMedia: ->
    playing = @get('medium')
    currentPlaylist = @get('media').get('currentPlaylist')
    selected = @get('media').get('selected').get('firstObject')
    first = @get('media').get('firstObject')
#
    if playing && playing.get('paused')
      return @togglePlay()
    if currentPlaylist
      if currentPlaylist.get('selected')
        return @play(currentPlaylist.get('selected')[0])
      return play(currentPlaylist[0])
    if selected
      return @play(selected)
    return @play(first)

  pauseMedia: ->
    @togglePlay()

  play: (media)->
    @get('media').clearFlagForAll('playing')
    media.set('playing', true)
    @set('medium', media)
    @resetPlayer()
    @bindControlEvents()
    @setupTimer()
    @togglePlay()

  bindControlEvents: ->
    media = @get('medium')
    $('#audio audio').bind 'play', ->
      media.setState('playing')
    .bind 'pause ended', ->
      media.setState('paused')
    .bind 'ended', ->
      media.setState('ended')

  setupTimer: (media) ->
    _self = @
    window.clearInterval()
    window.setInterval ()->
        _self.calculateTime()
      ,1000

  calculateTime: () ->
    a = $('#audio audio')[0];
    rem = parseInt(a.duration - a.currentTime, 10)
    pos = (a.currentTime / a.duration) * 100
    mins = Math.floor(rem/60,10)
    secs = rem - mins * 60
    timeleft = mins + ':' + (if secs > 9 then secs else '0' + secs)
    @get('medium').set('percent_played', 'width:' + ((a.currentTime / a.duration)*100) + '%')
    @get('medium').set('timeleft', timeleft)

  resetPlayer: ->
    media = @get('medium')
    $('#audio *').unbind()
    $('#audio').find('audio').remove()
    $('#audio').append @audio(media)

  togglePlay: ->
    audio = $('#audio audio')
    if audio[0].paused
      audio[0].play()
    else
      audio[0].pause()

  stepBackwardMedia: ->
    list = @get('media').get('showing')
    idx = list.indexOf(@get('medium')) - 1
    if idx < 0
      idx = list.length - 1
    medium = list.objectAt idx
    @play medium

  stepForwardMedia: ->
    list = @get('media').get('showing')
    idx = list.indexOf(@get('medium')) + 1
    if idx >= list.length
      idx = 0
    medium = list.objectAt idx
    @play medium

#
  audio: (media) ->
    $('<audio><source></source></audio>').attr('src', media.get('medium_file_url'))
)