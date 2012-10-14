App.ApplicationView = Ember.View.extend
	templateName: "application"


App.VideoView = Ember.View.extend
	videoEl: null

	observeIsPlaying: ((obj, key) ->
		if @get key
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
	observeIsPlaying: ((obj, key) ->
		if @get key
			@hide()
		else
			@show()

	).observes "controller.isPlaying"

	show: ->
		@$().fadeIn()

	hide: ->
		@$().fadeOut @get "controller.slowFadeOutSpeed"


App.ButtonPlayView = Ember.View.extend
	observeIsPlaying: ((obj, key) ->
		if @get key
			@hide()

	).observes "controller.isPlaying"

	hide: ->
		@$().fadeOut @get "controller.slowFadeOutSpeed"


App.QuizView = Ember.View.extend
	# Comment for debugging:
	isVisible: false

	observeIsPlaying: ((obj, key) ->
		if @get key
			@hide()
		else
			@show()

	).observes "controller.isPlaying"

	show: ->
		@$(".answer").fadeIn()
		@set "isVisible", true

	hide: ->
		@$(".answer").fadeOut()


App.AnswersView = Ember.CollectionView.extend
	# Comment for debugging:
	isVisible: false

	observeIsPlaying: ((obj, key) ->
		if @get key
			@hide()
		else
			@show()

	).observes "controller.isPlaying"

	observeIsLoadingNextQuestion: ((obj, key) ->
		if @get key
			@hide()
		else
			@show()

	).observes "controller.isLoadingNextQuestion"

	show: ->
		@$().slideDown()

	hide: ->
		@$().slideUp()


App.AnswerView = Ember.View.extend
	click: ->
		if @get("controller").checkAnswer @get "content.correct"
			@$().addClass("correct")
		else
			@$().addClass("incorrect")


App.ResultView = Ember.View.extend
	# Comment for debugging:
	isVisible: false

	observeIsPlaying: ((obj, key) ->
		@hide()

	).observes "controller.isPlaying"

	observeIsAnswerCorrect: ((obj, key) ->
		# Only show this if answer is either correct (true) or incorrect (false)
		if @get(key) is true or @get(key) is false
			@show()
		else
			@hide()
	).observes "controller.isAnswerCorrect"

	show: ->
		@set("isVisible", true)

	hide: ->
		@set("isVisible", false)


App.LeftShotsView = Ember.View.extend
	isVisible: false

	observeShotsLeft: ((obj, key) ->
		@$().fadeIn()

	).observes "controller.shotsLeft"