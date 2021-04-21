Class {
	#name : #AWSCloudFormationListExportsIntegrationTest,
	#superclass : #AWSCloudFormationIntegrationTest,
	#category : #'AWS-CloudFormation-Tests'
}

{ #category : #tests }
AWSCloudFormationListExportsIntegrationTest >> testListQueues [
	| list |
	list := self cloudformationService listExports.
	self assert: list notNil
]
