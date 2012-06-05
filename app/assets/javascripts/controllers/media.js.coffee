Empl.mediumsController = Ember.ArrayController.create(

  isSelected: (->
    @get('content').filterProperty('selected', true).length > 0
  ).property('content.@each.selected')

  selected: (->
    @get('content').filterProperty('selected', true)
  ).property('content.@each.selected')

  isPlaying: (->
    @get('content').filterProperty('playing', true).length > 0
  ).property('content.@each.selected')


  first: (->
    @get('content')[0]
  ).property()

  showAll: ->
    @get('content').forEach (item, idx, en)->
      item.set('showing', true)

  hideAll: ->
    @get('content').forEach (item, idx, en)->
      item.set('showing', false)
)
