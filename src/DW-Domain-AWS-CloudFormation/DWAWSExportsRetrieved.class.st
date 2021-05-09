Class {
	#name : #DWAWSExportsRetrieved,
	#superclass : #DWAWSAccountEvent,
	#instVars : [
		'exports',
		'requestId'
	],
	#category : #'DW-Domain-AWS-CloudFormation-Exports'
}

{ #category : #accessing }
DWAWSExportsRetrieved class >> latestVersion [
	<doc: 'Retrieves the latest version of the event class'>
	^ 1
]

{ #category : #'instance creation' }
DWAWSExportsRetrieved class >> withBuilder: aBuilder [
	<eventName: #EXPORTS_RETRIEVED>
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withExports;
		withRequestId;
		build: self.
	^ result
]

{ #category : #accessing }
DWAWSExportsRetrieved >> exports [
	^ exports
]

{ #category : #accessing }
DWAWSExportsRetrieved >> exports: anObject [
	exports := anObject
]

{ #category : #accessing }
DWAWSExportsRetrieved >> requestId [
	^ requestId
]

{ #category : #accessing }
DWAWSExportsRetrieved >> requestId: anObject [
	requestId := anObject
]
