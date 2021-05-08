Class {
	#name : #DWAWSAccountCreated,
	#superclass : #DWEventSourcingEvent,
	#instVars : [
		'accountId',
		'credentials'
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
		withAccountId;
		withCredentials;
		build: self.
	^ result
]

{ #category : #accessing }
DWAWSAccountCreated >> accountId [
	^ accountId
]

{ #category : #accessing }
DWAWSAccountCreated >> accountId: anObject [
	accountId := anObject
]

{ #category : #accessing }
DWAWSAccountCreated >> credentials [
	^ credentials
]

{ #category : #accessing }
DWAWSAccountCreated >> credentials: anObject [
	credentials := anObject
]
