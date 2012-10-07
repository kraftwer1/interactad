App.ButtonPlayView = Ember.View.extend
	templateName: "button_play"

	click: ->
		# Child -> parent communication
		@get("parentView").play()
		# ...could also use safer (when moving views), but hardcoded method:
		#@nearestInstanceOf(App.VideoView).play()