Class {
	#name : #DWAWSListExportsTest,
	#superclass : #BabyMock2TestCase,
	#traits : 'EDATDomainBDD',
	#classTraits : 'EDATDomainBDD classTrait',
	#category : #'DW-Domain-AWS-CloudFormation-Tests'
}

{ #category : #accessing }
DWAWSListExportsTest class >> credentials [

	^ AWSIntegrationTestResource current credentials
]

{ #category : #accessing }
DWAWSListExportsTest class >> resources [

	^ Array with: AWSIntegrationTestResource
]

{ #category : #accessing }
DWAWSListExportsTest >> credentials [
	^ self class credentials
]

{ #category : #'tests - examples' }
DWAWSListExportsTest >> exportsRetrieved_example [
	| exportsRetrieved exportingStackId name value region listExports accountCreated accountId |
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
	listExports := DWAWSListExports
		withBuilder:
			(EDABuilder
				with:
					(Dictionary new
						add: 'accountId' -> accountId;
						add: 'region' -> region;
						yourself)).
	exportsRetrieved := DWAWSExportsRetrieved
		withBuilder:
			(EDABuilder
				with:
					(Dictionary new
						add: 'exportingStackId' -> exportingStackId;
						add: 'name' -> name;
						add: 'value' -> value;
						yourself)).
	^ EDAExample
		given: (OrderedCollection with: accountCreated)
		when: listExports
		then: (OrderedCollection with: exportsRetrieved)
]

{ #category : #tests }
DWAWSListExportsTest >> exportsRetrieved_test [
	| example |
	example := self exportsRetrieved_example.
	self
		givenAggregate: #DWAWSAccount
		withEvents: example given
		whenReceiveCommand: example when
		ofType: 'LIST_EXPORTS'
		thenEvents: example then
]

{ #category : #tests }
DWAWSListExportsTest >> test_exportsRetrieved [
	^ self exportsRetrieved_test
]
