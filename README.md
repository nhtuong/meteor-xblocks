meteor-xblocks
===============

Let's you add xblocks to a meteor app

#### Useful Helpers ####

```
Template.registerHelper 'xblocksByDoc', (_id) ->
	if typeof window['xblocks'] != 'undefined'
		xblocks.find({doc:_id},{sort: {createdAt: -1}}).fetch()

Template.registerHelper 'xblocksByUser', (_id) ->
	if typeof window['xblocks'] != 'undefined'
		xblocks.find({owner:_id},{sort: {createdAt: -1}}).fetch()

Template.registerHelper 'xblocksByCollection', (collection) ->
	if typeof window['xblocks'] != 'undefined'
		xblocks = []
		xblocks = window['xblocks'].find({owner: Meteor.userId()},{sort: {createdAt: -1}}).fetch()
		collection = window[collection]

		_.each xblocks, (favorite)->
			xblocks.push(collection.findOne({_id:favorite.doc})) if collection.findOne({_id:favorite.doc})
		xblocks


Template.registerHelper 'xblocksCount', (_id)->
	if typeof window['xblocks'] != 'undefined'
		xblocks.find({doc:_id}).fetch().length

Template.registerHelper 'xblockingOn', (_id)->
	Session.equals 'xblockingOn', _id
	```
