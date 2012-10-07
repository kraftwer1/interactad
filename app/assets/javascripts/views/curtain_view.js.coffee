App.CurtainView = Ember.View.extend
	templateName: "curtain"

	play: ->
		# Child -> parent communication
		@get("parentView").play()
		@$().fadeOut()

	end: ->
		console.log "Quiz fadeIn()"