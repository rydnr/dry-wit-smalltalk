Class {
	#name : #AWSCloudFormationResponse,
	#superclass : #AWSXmlObject,
	#traits : 'EDATPrintOnHelper',
	#classTraits : 'EDATPrintOnHelper classTrait',
	#instVars : [
		'resultXml',
		'metadataXml'
	],
	#category : #'AWS-CloudFormation'
}

{ #category : #initialization }
AWSCloudFormationResponse >> initFromXmlElement: rootElement [
	resultXml := rootElement elements first.
	metadataXml := rootElement elementAt: 'ResponseMetadata'
]

{ #category : #accessing }
AWSCloudFormationResponse >> metadataXml [
	^ metadataXml
]

{ #category : #accessing }
AWSCloudFormationResponse >> requestId [
	^ self metadataXml contentStringAt: 'RequestId'
]

{ #category : #accessing }
AWSCloudFormationResponse >> resultXml [
	^ resultXml
]
