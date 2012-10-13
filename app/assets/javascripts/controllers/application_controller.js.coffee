App.ApplicationController = Ember.ObjectController.extend
	content: null
	isPlaying: false
	isAnswerCorrect: false

	init: ->
		@_super()

		# Add random question
		rand = Math.floor Math.random() * App.questions.length
		@set("content", App.questions[rand])

	play: ->
		@set("isPlaying", true)

	end: ->
		@set("isPlaying", false)		

	checkAnswer: (answer) ->
		if answer
			@set "isAnswerCorrect", true
		else
			@set "isAnswerCorrect", false