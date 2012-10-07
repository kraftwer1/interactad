App.ButtonPlayView = Ember.View.extend
	templateName: "button_play"
	click: ->
		this.trigger "playvideo"
		# this.get("parentView").hide()
		# video = $("video").get(0)
		# video.play()