Class {
	#name : #AWSCloudFormationListStacksIntegrationTest,
	#superclass : #AWSCloudFormationIntegrationTest,
	#category : #'AWS-CloudFormation-Tests'
}

{ #category : #tests }
AWSCloudFormationListStacksIntegrationTest >> testListStacks [
	| list |
	list := self cloudformationService listStacks.
	self assert: list notNil
]
