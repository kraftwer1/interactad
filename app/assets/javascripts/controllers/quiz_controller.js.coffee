App.QuizController = Ember.ObjectController.extend
	content: null

	init: ->
		@_super()

		# Add random question
		rand = Math.floor Math.random() * App.questions.length
		@set("content", App.questions[rand])

App.quizController = App.QuizController.create()