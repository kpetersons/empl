Empl.NewUpoadMediaView = Ember.View.extend(

  tagName: 'li'
  templateName: 'templates/media/new'


  newUploadMedium: ->
    Empl.MediaUploadView.create().appendTo('body')
)