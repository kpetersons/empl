Empl.MediaIndexItemView = Ember.View.extend(
  tagName: 'tr'
  templateName: 'templates/media/index_item'

  didInsertElement: ->
    _self = this
    @$().on 'selecting.empl', (evt)->
      if _self.$().hasClass('ui-selecting')
        _self.$().removeClass('ui-selecting')
        if _self.$().hasClass('selected-item')
          _self.$().removeClass('selected-item')
        else
          _self.$().addClass('selected-item')
        _self.get('medium').set('selected', _self.$().hasClass('selected-item'))
    return

)