App.ApplicationController = Ember.ObjectController.extend
	content: null
	isPlaying: false
	isAnswerCorrect: null
	isLoadingNextQuestion: false
	currentQuestionNr: null
	slowFadeOutSpeed: 1000

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
		@set "isLoadingNextQuestion", true

		that = @

		setTimeout ( ->

			# Empty content
			that.set "content", null

			# Reset answer
			that.set "isAnswerCorrect", null

			# Add random question
			that.set "currentQuestionNr", Math.floor Math.random() * App.questions.length
			that.set "content", App.questions[that.get("currentQuestionNr")]

			# Remove element from App.questions-array so that the question will not be asked again
			App.questions.splice that.get("currentQuestionNr"), 1

			that.set "isLoadingNextQuestion", false

		), @get "slowFadeOutSpeed"