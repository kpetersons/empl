#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./states
#= require_self

# Empl.stateManager is useful for debugging,
# but don't use it directly in application code.
stateManager = Empl.stateManager = Empl.StateManager.create()
Empl.initialize(stateManager)

jQuery  ->
  stateManager.send('ready')

Empl.store = DS.Store.create
  revision: 4
  adapter: DS.RESTAdapter.create
    bulkCommit: false

