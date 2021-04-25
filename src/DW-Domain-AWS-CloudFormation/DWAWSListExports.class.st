Class {
	#name : #DWAWSListExports,
	#superclass : #DWUserCommand,
	#instVars : [
		'algorithm',
		'credential',
		'date',
		'region',
		'signedHeaders',
		'signature'
	],
	#category : #'DW-Domain-AWS-CloudFormation-Exports'
}

{ #category : #meta }
DWAWSListExports class >> aggregateRootClass [
	^ DWAWSAccount
]

{ #category : #accessing }
DWAWSListExports class >> latestVersion [
	<doc: 'Updates the latest version of the command class'>
	^ 1
]

{ #category : #'instance creation' }
DWAWSListExports class >> withBuilder: aBuilder [
	<commandName: #LIST_EXPORTS>
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withCredential;
		withRegion;
		build: self.
	result version: self latestVersion.
	^ result
]

{ #category : #'aggregate selection' }
DWAWSListExports >> aggregateSelectionCriteria [
	^ Dictionary with: 'credential' -> self credential
]

{ #category : #accessing }
DWAWSListExports >> algorithm [
	^ algorithm
]

{ #category : #accessing }
DWAWSListExports >> algorithm: anObject [
	algorithm := anObject
]

{ #category : #accessing }
DWAWSListExports >> credential [
	^ credential
]

{ #category : #accessing }
DWAWSListExports >> credential: anObject [
	credential := anObject
]

{ #category : #accessing }
DWAWSListExports >> date [
	^ date
]

{ #category : #accessing }
DWAWSListExports >> date: anObject [
	date := anObject
]

{ #category : #accessing }
DWAWSListExports >> region [
	^ region
]

{ #category : #accessing }
DWAWSListExports >> region: anObject [
	region := anObject
]

{ #category : #accessing }
DWAWSListExports >> signature [
	^ signature
]

{ #category : #accessing }
DWAWSListExports >> signature: anObject [
	signature := anObject
]

{ #category : #accessing }
DWAWSListExports >> signedHeaders [
	^ signedHeaders
]

{ #category : #accessing }
DWAWSListExports >> signedHeaders: anObject [
	signedHeaders := anObject
]
