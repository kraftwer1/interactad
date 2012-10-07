App.Router = Ember.Router.extend
	location: "history"

	root: Ember.Route.extend
		index: Ember.Route.extend
			route: "/"