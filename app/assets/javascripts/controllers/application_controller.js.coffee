App.ApplicationController = Ember.ObjectController.extend
	content: null
	isPlaying: false
	isAnswerCorrect: null

	init: ->
		@_super()

		# Add random question
		rand = Math.floor Math.random() * App.questions.length
		@set("content", App.questions[rand])

	play: ->
		@set("isPlaying", true)

		# Reset answer
		@set("isAnswerCorrect", null)

	end: ->
		@set("isPlaying", false)		

	checkAnswer: (answer) ->
		if answer
			@set "isAnswerCorrect", true
			true
		else
			@set "isAnswerCorrect", false
			false