Asks.allow
	insert: (userId, doc) ->
		doc.owner == userId