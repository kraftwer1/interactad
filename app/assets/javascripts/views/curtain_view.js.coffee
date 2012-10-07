App.CurtainView = Ember.View.extend
	templateName: "curtain"
	playvideo: ->
		console.log "hoi hoi hoi"

	ended: ->
		console.log "Ended event"

	didInsertElement: ->
		this.$().on "playvideo", ->
			console.log "Debug message"

	hide: ->
		this.$().fadeOut()