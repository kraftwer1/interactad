App.VideoView = Ember.View.extend
	templateName: "video"
	videoEl: null

	didInsertElement: ->
		@videoEl = @$("video").get(0)
		$(@videoEl).on("ended", $.proxy(@end, @))

	play: ->
		@videoEl.play()

	end: ->
		# Parent -> children communication
		@get("childViews")[0].end()