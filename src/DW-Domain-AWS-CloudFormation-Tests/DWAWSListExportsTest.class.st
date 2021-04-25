Class {
	#name : #DWAWSListExportsTest,
	#superclass : #BabyMock2TestCase,
	#traits : 'EDATBDDHelper',
	#classTraits : 'EDATBDDHelper classTrait',
	#category : #'DW-Domain-AWS-CloudFormation-Tests'
}

{ #category : #'tests - examples' }
DWAWSListExportsTest >> exportsRetrieved_example [
	| exportsRetrieved exportingStackId name value credential region listExports |
	exportingStackId := UUID new greaseString.
	name := UUID new greaseString.
	value := UUID new greaseString.
	credential := 'credential'.
	region := 'eu-west-1'.
	listExports := DWAWSListExports
		withBuilder:
			(EDABuilder
				with:
					(Dictionary new
						add: 'credential' -> credential;
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
		given: OrderedCollection empty
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
