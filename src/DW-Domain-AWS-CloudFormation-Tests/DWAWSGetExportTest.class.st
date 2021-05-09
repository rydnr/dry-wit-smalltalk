Class {
	#name : #DWAWSGetExportTest,
	#superclass : #BabyMock2TestCase,
	#traits : 'DWAWSTIntegrationTest',
	#classTraits : 'DWAWSTIntegrationTest classTrait',
	#category : #'DW-Domain-AWS-CloudFormation-Tests'
}

{ #category : #examples }
DWAWSGetExportTest >> getExport_example [
	| exportsRetrieved exportingStackId name value region listExports accountCreated accountId exports exportRetrieved |
	region := 'eu-west-1'.
	accountId := UUID new greaseString.
	accountCreated := DWAWSAccountCreated
		withBuilder:
			(EDABuilder
				with:
					(Dictionary new
						add: 'accountId' -> accountId;
						add: 'credentials' -> self credentials;
						yourself)).
	exportingStackId := UUID new greaseString.
	name := UUID new greaseString.
	value := UUID new greaseString.
	exports := OrderedCollection
		with:
			(DWAWSExport
				withBuilder:
					(EDABuilder
						with:
							(Dictionary new
								add: 'exportingStackId' -> exportingStackId;
								add: 'name' -> name;
								add: 'value' -> value;
								yourself))).
	exportsRetrieved := DWAWSExportsRetrieved
		withBuilder:
			(EDABuilder
				with:
					(Dictionary new
						add: 'exports' -> exports;
						add: 'requestId' -> UUID new greaseString;
						yourself)).
	listExports := DWAWSGetExport
		withBuilder:
			(EDABuilder
				with:
					(Dictionary new
						add: 'accountId' -> accountId;
						add: 'region' -> region;
						add: 'name' -> name;
						yourself)).
	exports := OrderedCollection
		with:
			(DWAWSExport
				withBuilder:
					(EDABuilder
						with:
							(Dictionary new
								add: 'exportingStackId' -> exportingStackId;
								add: 'name' -> name;
								add: 'value' -> value;
								yourself))).
	exportRetrieved := DWAWSExportRetrieved
		withBuilder:
			(EDABuilder
				with:
					(Dictionary new
						add: 'name' -> name;
						add: 'value' -> value;
						add: 'exportingStackId' -> exportingStackId;
						yourself)).
	^ EDAExample
		given: (OrderedCollection with: accountCreated with: exportsRetrieved)
		when: listExports
		then: (OrderedCollection with: exportRetrieved)
]

{ #category : #tests }
DWAWSGetExportTest >> getExport_test [
	| example |
	example := self getExport_example.
	self
		givenAggregate: #DWAWSAccount
		withEvents: example given
		whenReceiveCommand: example when
		ofType: 'GET_EXPORT'
		thenEvents: example then
]

{ #category : #tests }
DWAWSGetExportTest >> test_getExport [
	^ self getExport_test
]
