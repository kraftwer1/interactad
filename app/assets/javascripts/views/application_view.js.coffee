App.ApplicationView = Ember.View.extend
	templateName: "application"


App.VideoView = Ember.View.extend
	videoEl: null

	observeIsPlaying: ( ->
		if @get "controller.isPlaying"
			@play()

	).observes "controller.isPlaying"

	didInsertElement: ->
		@videoEl = @$("video").get 0
		$(@videoEl).on("ended", $.proxy(@end, @))

	play: ->
		@videoEl.play()

	end: ->
		@get("controller").end()


App.CurtainView = Ember.View.extend
	observeIsPlaying: ( ->
		if @get "controller.isPlaying"
			@hide()
		else
			@show()

	).observes "controller.isPlaying"

	hide: ->
		@$().fadeOut()

	show: ->
		@$().fadeIn()
	

App.ButtonPlayView = Ember.View.extend
	observeIsPlaying: ( ->
		if "controller.isPlaying"
			@hide()

	).observes "controller.isPlaying"

	click: ->
		@get("controller").play()

	hide: ->
		@set "isVisible", false


App.QuizView = Ember.View.extend
	isVisible: false

	observeIsPlaying: ( ->
		if @get "controller.isPlaying"
			@hide()
		else
			@show()

	).observes "controller.isPlaying"

	hide: ->
		@$(".answer").fadeOut()

	show: ->
		@$(".answer").fadeIn()
		@set "isVisible", true


App.AnswersView = Ember.CollectionView.extend()


App.AnswerView = Ember.View.extend
	isVisible: false

	click: ->
		@get("controller").checkAnswer @get "content.correct"


App.ResultView = Ember.View.extend()


App.ButtonReplayView = Ember.View.extend
	observeIsPlaying: ( ->
		if @get("controller.isPlaying")
			@$().fadeOut()
		else
			@$().fadeIn()		

	).observes "controller.isPlaying"

	click: ->
		@get("controller").play()