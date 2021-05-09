Class {
	#name : #AWSCloudFormationResponse,
	#superclass : #AWSXmlObject,
	#instVars : [
		'resultXml',
		'metadataXml',
		'requestId'
	],
	#category : #'AWS-CloudFormation'
}

{ #category : #initialization }
AWSCloudFormationResponse >> initFromXmlElement: rootElement [
	self resultXml: (self parseResultXml: rootElement).
	self metadataXml: (self parseMetadataXml: rootElement).
	self requestId: self parseRequestId
]

{ #category : #accessing }
AWSCloudFormationResponse >> metadataXml [
	^ metadataXml
]

{ #category : #accessing }
AWSCloudFormationResponse >> metadataXml: anObject [
	metadataXml := anObject
]

{ #category : #protected }
AWSCloudFormationResponse >> parseMetadataXml: rootElement [
	^ rootElement elementAt: 'ResponseMetadata'
]

{ #category : #protected }
AWSCloudFormationResponse >> parseRequestId [
	^ self metadataXml contentStringAt: 'RequestId'
]

{ #category : #protected }
AWSCloudFormationResponse >> parseResultXml: rootElement [
	^ rootElement elements first
]

{ #category : #accessing }
AWSCloudFormationResponse >> requestId [
	^ requestId
]

{ #category : #accessing }
AWSCloudFormationResponse >> requestId: aString [
	requestId := aString
]

{ #category : #accessing }
AWSCloudFormationResponse >> resultXml [
	^ resultXml
]

{ #category : #accessing }
AWSCloudFormationResponse >> resultXml: anObject [
	resultXml := anObject
]
