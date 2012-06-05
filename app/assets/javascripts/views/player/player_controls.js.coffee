Empl.PlayerControlsView = Ember.View.extend(

  templateName: 'templates/player/player_controls'

  areControlsDisabled: (->
    !@get('media').get('isSelected')
  ).property('media.isSelected')

  isPlaying:(->
    return @get('media').get('isPlaying')
  ).property('isPlaying')


  newAddToPlaylist: ->
    Empl.AddToPlaylistFormView.create().appendTo('body')


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
    @set('medium', media)
    $('#audio *').unbind()
    $('#audio').find('audio').remove()
    $('#audio').append @audio(media)
    @bindControlEvents(media)
    @setupTimer(media)
    @togglePlay()

  bindControlEvents: (media) ->
    $('#audio audio').bind 'play', ->
      $("i.icon-play").addClass('disabled');
      $("i.icon-pause").removeClass('disabled');
      media.setState('playing')
    .bind 'pause ended', ->
      $("i.icon-pause").addClass('disabled')
      $("i.icon-play").removeClass('disabled');
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
    @.get('medium').set('percent_played', 'width:' + ((a.currentTime / a.duration)*100) + '%')
    @.get('medium').set('timeleft', timeleft)

#      idx = Empl.mediaController.indexOf(_self.get('medium')) + 1
#      if idx >= Empl.mediaController.content.length
#        newMedia = Empl.mediaController.objectAt(0)
#      else
#        newMedia = Empl.mediaController.objectAt(idx)
#      _self.set('medium', newMedia)
#      _self.resetPlayer()


#    $('#audio').find('#play_control').click ->
#      _self.togglePlay()
#    this.get('medium').set('percent_played', 'width:0%')
#    this.get('medium').set('timeleft', '00:00')
#    _self.togglePlay()
#    window.setInterval ->
#        _self.updateTimer()
#      ,1000
    return @

#  resetPlayer: ->
#    $('#audio *').unbind()
#    this.startPlayer()
#
  togglePlay: ->
    audio = $('#audio audio')
    if audio[0].paused
      audio[0].play()
    else
      audio[0].pause()

#
  audio: (media) ->
    $('<audio><source></source></audio>').attr('src', media.get('medium_file_url'))
)