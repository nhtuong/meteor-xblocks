meteor-xblocks
===============

Let's you add xblocks to a meteor app

#### Useful Helpers ####

```
Template.registerHelper 'XblocksByDoc', (_id) ->
	if typeof window['Xblocks'] != 'undefined'
		Xblocks.find({doc:_id},{sort: {createdAt: -1}}).fetch()

Template.registerHelper 'XblocksByUser', (_id) ->
	if typeof window['Xblocks'] != 'undefined'
		Xblocks.find({owner:_id},{sort: {createdAt: -1}}).fetch()

Template.registerHelper 'XblocksByCollection', (collection) ->
	if typeof window['Xblocks'] != 'undefined'
		Xblocks = []
		xblocks = window['Xblocks'].find({owner: Meteor.userId()},{sort: {createdAt: -1}}).fetch()
		collection = window[collection]

		_.each xblocks, (favorite)->
			Xblocks.push(collection.findOne({_id:favorite.doc})) if collection.findOne({_id:favorite.doc})
		Xblocks


Template.registerHelper 'xblocksCount', (_id)->
	if typeof window['Xblocks'] != 'undefined'
		Xblocks.find({doc:_id}).fetch().length

Template.registerHelper 'xblockingOn', (_id)->
	Session.equals 'xblockingOn', _id
	```
