App.VideoPlayerView = Ember.View.extend
	templateName: "videoplayer"


App.VideoView = App.VideoPlayerView.extend
	templateName: ""
	videoEl: null

	didInsertElement: ->
		@videoEl = @$("video").get(0)
		$(@videoEl).on("ended", $.proxy(@end, @))

	play: ->
		@videoEl.play()

	end: ->
		# Parent -> children communication
		childView.end() for childView in @get("childViews")


App.CurtainView = App.VideoView.extend
	play: ->
		# Child -> parent communication
		@get("parentView").play()
		@$().fadeOut()

	end: ->
		console.log "Quiz fadeIn()"


App.ButtonPlayView = App.VideoView.extend

	click: ->
		# Child -> parent communication
		@get("parentView").play()
		# ...could also use safer (when moving views), but hardcoded method:
		#@nearestInstanceOf(App.VideoView).play()