App.ApplicationView = Ember.View.extend
	templateName: "application"
	didInsertElement: ->
		video = $("video").get(0)
		# video.play()