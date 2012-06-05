Empl.ResetRestrictionsView = Ember.View.extend(

  tagName: 'li'
  templateName: 'templates/media/reset'


  resetViewingRestrictions: ->
    Empl.mediumsController.showAll()
)