Class {
	#name : #DWAWSAccountInAWSRegion,
	#superclass : #DWAggregateRoot,
	#instVars : [
		'credential'
	],
	#category : #'DW-Domain-AWS'
}

{ #category : #'instance creation' }
DWAWSAccountInAWSRegion class >> withBuilder: aBuilder [
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withCredential;
		build: self.
	^ result
]

{ #category : #'event handling' }
DWAWSAccountInAWSRegion >> applyAWSAccountInAWSRegionCreatedv1: anEvent [
	self tenant: anEvent tenant.
	self credential: anEvent credential.
]

{ #category : #accessing }
DWAWSAccountInAWSRegion >> credential [
	^ credential
]

{ #category : #accessing }
DWAWSAccountInAWSRegion >> credential: anObject [
	credential := anObject
]

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
					add: #requestId -> '5ccc7dcd-744c-11e5-be70-1b08c228efb3';
						yourself))
]
