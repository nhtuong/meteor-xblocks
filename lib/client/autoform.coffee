AutoForm.hooks xblockForm:
  onError: (operation, error, template) ->
  	sAlert.error error

  formToDoc: (doc, ss, formId) ->
  	doc.doc = Template.instance().data.xblockDocId
  	doc.owner = Meteor.userId()
  	doc