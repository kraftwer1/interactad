App.VideoPlayerView = Ember.View.extend
	templateName: "videoplayer"


App.VideoView = Ember.View.extend
	templateName: ""
	videoEl: null

	didInsertElement: ->
		@videoEl = @$("video").get(0)
		$(@videoEl).on("ended", $.proxy(@end, @))

	play: ->
		@videoEl.play()

		# Parent -> children communication
		childView.play() for childView in @get("childViews")

	end: ->
		childView.end() for childView in @get("childViews")


App.CurtainView = Ember.View.extend
	play: ->
		@$().fadeOut()

	end: ->
		childView.end() for childView in @get("childViews")
		@$().fadeIn()


App.ButtonPlayView = Ember.View.extend
	click: ->
		# Calling @_super() would be more elegant, but uses "this"
		# instead of the parent classes context. I don't know
		# how to prevent that...
		# StackOverflow is here:
		# http://stackoverflow.com/questions/12796048/how-can-i-make-super-using-the-parent-objects-context
		@nearestInstanceOf(App.VideoView).play()

	end: ->
		@set("isVisible", false)


App.QuizView = Ember.View.extend
	isVisible: false

	play: ->
		childView.play() for childView in @get("childViews")

		@$(".answer").fadeOut()

	end: ->
		childView.end() for childView in @get("childViews")

		@$(".answer").fadeIn()

		# Only important for the first play:
		@$().fadeIn()
		@set("isVisible", true)


App.ButtonReplayView = Ember.View.extend
	click: ->
		@nearestInstanceOf(App.VideoView).play()

	play: ->
		@$().fadeOut()

	end: ->
		@$().fadeIn()