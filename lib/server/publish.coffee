Meteor.publish 'xblocks', ->
	Asks.find()

Meteor.publish 'xblocksByDoc', (_id) ->
	Asks.find {doc: _id}

Meteor.publish 'xblocksByUser', (_id) ->
	Favorites.find {owner: _id}