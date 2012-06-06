Empl.MediaIndexView = Ember.View.extend(

  tagName: 'table'
  classNames: ['table', 'table-condensed', 'media-table']
  templateName: 'templates/media/index'
  activePlaylistBinding: 'Empl.playlistsController.activePlaylist'

  didInsertElement: ->
    _self = @
    @$('tbody').selectable
      filter: "tr"
      selecting: (event, ui)->
        _self.$('tbody tr').trigger('selecting.empl')
    return @

  showing_media: (->
    @get('media').filterProperty('showing')
  ).property('media.@each.showing')

)