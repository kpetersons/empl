Empl.mediumsController = Ember.ArrayController.create

  isSelected: (->
    @get('content').filterProperty('selected', true).length > 0
  ).property('content.@each.selected')

  selected: (->
    @get('content').filterProperty('selected', true)
  ).property('content.@each.selected')

  showing: (->
    @get('content').filterProperty('showing', true)
  ).property('content.@each.showing')

  isPlaying: (->
    @get('content').filterProperty('playing', true).length > 0
  ).property('content.@each.playing')

  clearFlagForAll: (flag) ->
    @get('content').forEach (item, idx, en) ->
      item.set(flag, false)

  first: (->
    @get('content')[0]
  ).property()


  showAll: ->
    @get('content').forEach (item, idx, en)->
      item.set('showing', true)

  hideAll: ->
    @get('content').forEach (item, idx, en)->
      item.set('showing', false)
