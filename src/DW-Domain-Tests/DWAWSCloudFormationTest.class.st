Class {
	#name : #DWAWSCloudFormationTest,
	#superclass : #BabyMock2TestCase,
	#traits : 'EDATDomainBDD',
	#classTraits : 'EDATDomainBDD classTrait',
	#category : #'DW-Domain-Tests'
}

{ #category : #tests }
DWAWSCloudFormationTest >> listExports_example [
	| credential accountCreated stackCreatedAttrs stackCreated listExportsAttrs listExports listExportsRetrievedAttrs listExportsRetrieved exports |
	credential := '[Access key ID and scope]'.
	accountCreated := DWAWSAccountInAWSRegionCreated
		withBuilder:
			(EDABuilder
				with:
					(Dictionary new
						add: #credential -> credential;
						yourself)).
	stackCreatedAttrs := Dictionary new.
	stackCreatedAttrs
		add:
			#stackId
				->
					'arn:aws:cloudformation:us-east-1:123456789012:stack/SampleStack/12a3b456-0e10-4ce0-9052-5d484a8c4e5b';
		add: #eventId -> '1dedea10-eaf0-11e5-8451-500c5242948e';
		add: #logicalResourceId -> 'SampleStack';
		add: #stackName -> 'SampleStack';
		add:
			#physicalResourceId
				->
					'#arn:aws:cloudformation:us-east-1:123456789012:stack/SampleStack/12a3b456-0e10-4ce0-9052-5d484a8c4e5b'.
	stackCreated := DWAWSStackCreated
		withBuilder: (EDABuilder with: stackCreatedAttrs).
	listExportsAttrs := Dictionary new.
	listExportsAttrs
		add: #version -> '2015-05-15';
		add: #algorithm -> 'AWS4-HMAC-SHA256';
		add: #credential -> credential;
		add: #date -> '20160316T233349Z';
		add: #signedHeaders -> 'content-type;host';
		add: #signature -> '[Signature]'.
	listExports := DWAWSListExports
		withBuilder: (EDABuilder with: listExportsAttrs).
	listExportsRetrievedAttrs := Dictionary new.
	exports := OrderedCollection new.
	exports
		add:
			(DWAWSCloudFormationExport
				withBuilder:
					(EDABuilder
						with:
							(Dictionary new
								add: #name -> 'mySampleStack1-SecurityGroupID';
								add:
									#exportingStackId
										->
											'arn:aws:cloudformation:us-east-1:123456789012:stack/mySampleStack1/12a3b456-0e10-4ce0-9052-5d484a8c4e5b';
								add: #value -> 'sg-0a123b45';
								yourself))).
	listExportsRetrievedAttrs
		add: #exports -> exports;
		add: #requestId -> '5ccc7dcd-744c-11e5-be70-1b08c228efb3'.
	listExportsRetrieved := DWAWSListExportsRetrieved
		withBuilder: (EDABuilder with: listExportsRetrievedAttrs).
	^ EDAExample
		given: (OrderedCollection with: accountCreated with: stackCreated)
		when: listExports
		then: (OrderedCollection with: listExportsRetrieved)
]

{ #category : #tests }
DWAWSCloudFormationTest >> listExports_test [
	| example |
	example := self listExports_example.
	self
		givenAggregate: #DWAWSAccountInAWSRegion
		withEvents: example given
		whenReceiveCommand: example when
		thenEvents: example then
]

{ #category : #tests }
DWAWSCloudFormationTest >> testListExports [
	^ self listExports_test
]
