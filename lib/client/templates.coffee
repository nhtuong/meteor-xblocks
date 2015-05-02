Template.xblockFormToggle.events
	'click .btn-xblock': (e,t) ->
		Session.set 'xblockingOn', $(e.currentTarget).attr('doc')
	'click .btn-cancel-xblock': (e,t)->
		Session.set 'xblockingOn', null

Template.xblockFormToggle.destroyed = () ->
	Session.set 'xblockingOn', null

AutoForm.hooks xblockForm:

	onSuccess: (operation, result, template) ->
		Session.set 'xblockingOn', null