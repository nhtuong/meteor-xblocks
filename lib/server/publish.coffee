Meteor.publish 'xblocks', ->
	Xblocks.find()

Meteor.publish 'xblocksByDoc', (_id) ->
	Xblocks.find {doc: _id}

Meteor.publish 'xblocksByUser', (_id) ->
	Favorites.find {owner: _id}