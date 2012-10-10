questions = [
	question: "Welcher Passant hat die Flasche in den Gitarrenkoffer gelegt?"
	answers: [
		answer: "Der sechste"
		correct: true
	,
		answer: "Der siebte"
		correct: false
	,
		answer: "Der achte"
		correct: false
	]
,
	question: "Welche Farbe hat das T-Shirt des Strassenmusikers?"
	answers: [
		answer: "Scharz"
		correct: false
	,
		answer: "Schwarz"
		correct: true
	,
		answer: "Gelb"
		correct: false
	]
]

App.TestController = Ember.ObjectController.extend
	content: null
	init: ->
		@_super()

		# Add random question
		rand = Math.floor Math.random() * questions.length
		@set("content", questions[rand])

App.testController = App.TestController.create()