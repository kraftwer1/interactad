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
		@$().fadeOut()
		@get("parentView").play()

	end: ->
		@$().fadeIn()


App.ButtonPlayView = App.CurtainView.extend
	click: ->
		@play()

	play: ->
		# Calling @_super() would be more elegant, but uses "this"
		# instead of the parent classes context. I don't know
		# how to prevent that...
		# StackOverflow is here:
		# http://stackoverflow.com/questions/12796048/how-can-i-make-super-using-the-parent-objects-context
		@get("parentView").play()


App.QuizView = App.VideoView.extend
	isVisible: false
	end: ->
		@$().fadeIn()
		@toggleProperty("isVisible")