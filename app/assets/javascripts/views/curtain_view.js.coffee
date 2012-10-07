App.CurtainView = Ember.View.extend
	templateName: "curtain"
	didInsertElement: ->
		this.$().on "playvideo", ->
			console.log "Debug message"
	hide: ->
		this.$().fadeOut()