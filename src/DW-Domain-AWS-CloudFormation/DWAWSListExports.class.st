Class {
	#name : #DWAWSListExports,
	#superclass : #DWUserCommand,
	#instVars : [
		'credential',
		'region'
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
DWAWSListExports >> credential [
	^ credential
]

{ #category : #accessing }
DWAWSListExports >> credential: anObject [
	credential := anObject
]

{ #category : #accessing }
DWAWSListExports >> region [
	^ region
]

{ #category : #accessing }
DWAWSListExports >> region: anObject [
	region := anObject
]
