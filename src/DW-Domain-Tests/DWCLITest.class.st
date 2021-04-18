Class {
	#name : #DWCLITest,
	#superclass : #BabyMock2TestCase,
	#category : #'DW-Domain-Tests'
}

{ #category : #tests }
DWCLITest >> testTautology [
	self assert: DWCLI new isNotNil
]
