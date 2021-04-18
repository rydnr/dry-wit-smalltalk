Class {
	#name : #DWAWSListExportsRetrieved,
	#superclass : #EDAEventSourcingEvent,
	#instVars : [
		'exports',
		'requestId'
	],
	#category : #'DW-Domain-AWS-CloudFormation'
}

{ #category : #meta }
DWAWSListExportsRetrieved class >> aggregateRootClass [
	^ DWAWSAccountInAWSRegion
]

{ #category : #accessing }
DWAWSListExportsRetrieved class >> latestVersion [
	<doc: 'Retrieves the latest version of the event class'>
	^ 1
]

{ #category : #'instance creation' }
DWAWSListExportsRetrieved class >> withBuilder: aBuilder [
	<eventName: #LIST_EXPORTS_RETRIEVED>
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withExports;
		withRequestId;
		build: self.
	^ result
]

{ #category : #accessing }
DWAWSListExportsRetrieved >> exports [
	^ exports
]

{ #category : #accessing }
DWAWSListExportsRetrieved >> exports: anObject [
	exports := anObject
]

{ #category : #accessing }
DWAWSListExportsRetrieved >> requestId [
	^ requestId
]

{ #category : #accessing }
DWAWSListExportsRetrieved >> requestId: anObject [
	requestId := anObject
]
