Class {
	#name : #DWAWSListExports,
	#superclass : #EDAUserCommand,
	#instVars : [
		'algorithm',
		'credential',
		'date',
		'signedHeaders',
		'signature'
	],
	#category : #'DW-Domain-AWS-CloudFormation'
}

{ #category : #meta }
DWAWSListExports class >> aggregateRootClass [
	^ DWAWSAccountInAWSRegion
]

{ #category : #accessing }
DWAWSListExports class >> latestVersion [
	<doc: 'Updates the latest version of the command class'>
	^ 1
]

{ #category : #'instance creation' }
DWAWSListExports class >> withBuilder: aBuilder [
	<eventName: #LIST_EXPORTS>
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withVersion;
		withAlgorithm;
		withCredential;
		withDate;
		withSignedHeaders;
		withSignature;
		build: self.
	^ result
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
