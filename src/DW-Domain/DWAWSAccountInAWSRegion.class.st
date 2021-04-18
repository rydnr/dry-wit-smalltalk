Class {
	#name : #DWAWSAccountInAWSRegion,
	#superclass : #EDAAggregateRoot,
	#category : #'DW-Domain-AWS'
}

{ #category : #'command handling' }
DWAWSAccountInAWSRegion >> handleListExports: aCommand [
	<useAsCommandHandlerFor: #DWAWSListExports>
	^ DWAWSListExportsRetrieved
		withBuilder:
			(EDABuilder
				with:
					(Dictionary new
						add:
							#exports
								->
									(OrderedCollection
										with:
											(Dictionary new
												add: #name -> 'mySampleStack1-SecurityGroupID';
												add:
													#exportingStackId
														->
															'arn:aws:cloudformation:us-east-1:123456789012:stack/mySampleStack1/12a3b456-0e10-4ce0-9052-5d484a8c4e5b';
												add: #value -> 'sg-0a123b45';
												yourself));
						add: #requestId -> aCommand commandId;
						yourself))
]
