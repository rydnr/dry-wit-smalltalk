Class {
	#name : #DWAWSExportRetrieved,
	#superclass : #DWMessage,
	#instVars : [
		'name',
		'value',
		'exportingStackId'
	],
	#category : #'DW-Domain-AWS-CloudFormation-Exports'
}

{ #category : #'instance creation' }
DWAWSExportRetrieved class >> withBuilder: aBuilder [
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withName;
		withValue;
		withExportingStackId;
		build: self.
	^ result
]

{ #category : #accessing }
DWAWSExportRetrieved >> exportingStackId [
	^ exportingStackId
]

{ #category : #accessing }
DWAWSExportRetrieved >> exportingStackId: anObject [
	exportingStackId := anObject
]

{ #category : #accessing }
DWAWSExportRetrieved >> name [
	^ name
]

{ #category : #accessing }
DWAWSExportRetrieved >> name: anObject [
	name := anObject
]

{ #category : #accessing }
DWAWSExportRetrieved >> value [
	^ value
]

{ #category : #accessing }
DWAWSExportRetrieved >> value: anObject [
	value := anObject
]
