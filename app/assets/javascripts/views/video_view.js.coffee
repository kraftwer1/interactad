App.VideoView = Ember.View.extend
	templateName: "video"
	didInsertElement: ->
		this.$().on "playvideo", (event) ->
			console.log event

	playvideo: ->
		console.log "Juhui!"