Empl.MediaUploadView = Ember.View.extend(
  elementId: 'upload-medium'
  classNames: ['modal']
  
  templateName: 'templates/media/form'
  

  willInsertElement: ->
    @close()      

  didInsertElement: ->    
    _self = this
    @$().find('form').submit ->
      $.ajax
        type: 'POST'
        async:false
        url: '/mediums'
        files: $(":file", this)
        iframe: true
      .complete (data) ->
        response = jQuery.parseJSON($(data.responseText).html())
        Empl.mediumsController.set('content', Empl.store.find(Empl.Medium))
        _self.close()
      return false
    @$().modal()

  submitUploadMedium: (e)->
    e.preventDefault()
    console.log @$().find('form')
    @$().find('form').submit()
    return

  cancelUploadMedium: ->
    @close()

  close: ->
    @$().modal('hide').remove()
)