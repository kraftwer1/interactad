App.ApplicationController = Ember.ObjectController.extend
	content: null
	isPlaying: false
	isAnswerCorrect: null
	currentQuestionNr: null

	init: ->
		@_super()
		@nextQuestion()


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


	nextQuestion: ->
		# Empty content
		@set("content", null)

		# Reset answer
		@set("isAnswerCorrect", null)

		# Add random question
		@set "currentQuestionNr", Math.floor Math.random() * App.questions.length
		@set "content", App.questions[@get("currentQuestionNr")]

		# Remove element from App.questions-array so that the question will not be asked again
		App.questions.splice @get("currentQuestionNr"), 1