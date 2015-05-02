Template.registerHelper 'xblocksByDoc', (_id) ->
	if typeof window['Asks'] != 'undefined'
		Asks.find({doc:_id},{sort: {createdAt: -1}}).fetch()

Template.registerHelper 'xblocksByUser', (_id) ->
	if typeof window['Asks'] != 'undefined'
		Asks.find({owner:_id},{sort: {createdAt: -1}}).fetch()

Template.registerHelper 'xblocksByCollection', (collection) ->
	if typeof window['Asks'] != 'undefined'
		Asks = []
		xblocks = window['Asks'].find({owner: Meteor.userId()},{sort: {createdAt: -1}}).fetch()
		collection = window[collection]

		_.each xblocks, (favorite)->
			Asks.push(collection.findOne({_id:favorite.doc})) if collection.findOne({_id:favorite.doc})
		Asks


Template.registerHelper 'xblockCount', (_id)->
	if typeof window['Asks'] != 'undefined'
		Asks.find({doc:_id}).fetch().length

Template.registerHelper 'xblockingOn', (_id)->
	Session.equals 'xblockingOn', _id