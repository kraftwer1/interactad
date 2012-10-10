Question = Ember.Object.extend
	question: null
	answers: []

questions = [
	Question.create
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
	Question.create
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

App.QuizController = Ember.ArrayController.extend
	content: questions

App.quizController = App.QuizController.create()