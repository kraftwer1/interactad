#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./store
#= require questions
#= require_self
App.initialize();

quiz = $("#quiz")
curtain = $("#curtain")
buttonPlay = $("#buttonPlay")
videoplayer = _V_ "interactad_clip"


play = ->
	videoplayer.play()
	quiz.fadeOut()
	curtain.fadeOut ->
		buttonPlay.hide()


# Register events
videoplayer.addEvent "ended", ->
	curtain.show()

	setTimeout ( ->
		quiz.fadeIn()
	), 1000

buttonPlay.on "click", ->
	play()

$("#buttonReplay").on "click", ->
	play()