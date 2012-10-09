App.Router = Ember.Router.extend
	location: "history"

	root: Ember.Route.extend
		index: Ember.Route.extend
			route: "/"
			connectOutlets: (router) ->
				router.get("applicationController").connectOutlet("videoPlayer")