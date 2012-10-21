App.ApplicationController = Ember.ObjectController.extend
	content: null
	isPlaying: false
	isAnswerCorrect: null
	isLoadingNextQuestion: false
	currentQuestionNr: 0
	currentQuestionArrayIndex: null
	amountOfQuestionsBeingAsked: 4
	slowFadeSpeed: 1000
	delayBetweenQuestions: 500
	isGameOver: false
	isGameWon: false
	shotsLeft: 3
	shotsLeftGermanized: (() ->
		if @get("shotsLeft") is 3
			"Nur noch drei Versuche"
		else if @get("shotsLeft") is 2
			"Nur noch zwei Versuche"
		else if @get("shotsLeft") is 1
			"Nur noch ein Versuch"
		else
			"Keine Versuche mehr"
	).property("shotsLeft")

	init: ->
		@_super()
		@nextQuestion()


	play: ->
		@set "isPlaying", true

		# Reset answer
		@set "isAnswerCorrect", null

	end: ->
		@set "isPlaying", false	


	checkAnswer: (answer) ->
		if answer
			@set "isAnswerCorrect", true

			if @get("currentQuestionNr") is @get("amountOfQuestionsBeingAsked")
				@set "isGameWon", true

			true

		else
			@set "isAnswerCorrect", false
			@set "shotsLeft", @get("shotsLeft") - 1

			if @get("shotsLeft") is 0
				@set "isGameOver", true

			false


	nextQuestion: ->
		@set "isLoadingNextQuestion", true

		that = @

		setTimeout ( ->

			# Empty content
			that.set "content", null

			# Reset answer
			that.set "isAnswerCorrect", null

			# Add random question
			that.set "currentQuestionArrayIndex", Math.floor Math.random() * App.questions.length
			that.set "content", App.questions[that.get("currentQuestionArrayIndex")]

			# Remove element from App.questions-array so that the question will not be asked again
			App.questions.splice that.get("currentQuestionArrayIndex"), 1

			that.set "currentQuestionNr", that.get("currentQuestionNr") + 1
			that.set "isLoadingNextQuestion", false

		), @get "delayBetweenQuestions"