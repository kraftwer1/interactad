App.VideoView = Ember.View.extend
	templateName: "video"
	play: ->
		this.$("video").get(0).play()