Class {
	#name : #AWSCloudFormationIntegrationTest,
	#superclass : #AWSIntegrationTest,
	#instVars : [
		'cloudformationService'
	],
	#category : #'AWS-CloudFormation-Tests'
}

{ #category : #accessing }
AWSCloudFormationIntegrationTest >> cloudformationService [
	^ cloudformationService ifNil: [ cloudformationService := self createCloudFormationService ]
]

{ #category : #internal }
AWSCloudFormationIntegrationTest >> createCloudFormationService [
	^ AWSCloudFormationService
		newWithCredentials: self credentials
		region: self regionName
]
