Empl.MediumInfoView = Ember.View.extend(
  elementId: 'medium-info'
  classNames: ['modal']

  templateName: 'templates/media/info/form'

  willInsertElement: ->
    @close()

  didInsertElement: ->
    @$().modal()

  submitMediumInfo: (e)->
    e.preventDefault()
    @$().find('form').submit()
    return

  cancelMediumInfo: ->
    @close()

  close: ->
    @$().modal('hide').remove()
)