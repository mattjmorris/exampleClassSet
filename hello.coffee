
if Meteor.isClient
  #NOTE: these will be coming from DB in real code
  @observations = [{name: 'crying'}, {name: 'hitting'}, {name: 'shaking'}]

  Template.hello.created = ->
    observationStates = {}
    _.each observations, (obs) -> observationStates[obs.name] = 'blank'
    Session.setDefault 'observationStates', observationStates

  Template.hello.helpers
    'observations': ->
      return observations
    'obsClass': ->
      observationStates = Session.get 'observationStates'
      return observationStates[@name]

  Template.hello.events
    'click #obsButton': ->
      console.log 'i was clicked'
      observationStates = Session.get 'observationStates'
      currentState = observationStates[@name]
      if currentState is 'blank' or currentState is 'no'
        observationStates[@name] = 'yes'
      else
        observationStates[@name] = 'no'
      Session.set 'observationStates', observationStates


