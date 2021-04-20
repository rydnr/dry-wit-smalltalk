Class {
	#name : #DWAWSAccountCreated,
	#superclass : #DWEventSourcingEvent,
	#instVars : [
		'credential'
	],
	#category : #'DW-Domain-AWS'
}

{ #category : #meta }
DWAWSAccountCreated class >> aggregateRootClass [
	^ DWAWSAccount
]

{ #category : #accessing }
DWAWSAccountCreated class >> latestVersion [
	<doc: 'Retrieves the latest version of the event class'>
	^ 1
]

{ #category : #meta }
DWAWSAccountCreated class >> withBuilder: aBuilder [
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withCredential;
		build: self.
	^ result
]

{ #category : #accessing }
DWAWSAccountCreated >> credential [
	^ credential
]

{ #category : #accessing }
DWAWSAccountCreated >> credential: anObject [
	credential := anObject
]
