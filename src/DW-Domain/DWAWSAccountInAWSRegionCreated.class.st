Class {
	#name : #DWAWSAccountInAWSRegionCreated,
	#superclass : #DWEventSourcingEvent,
	#instVars : [
		'credential'
	],
	#category : #'DW-Domain-AWS'
}

{ #category : #meta }
DWAWSAccountInAWSRegionCreated class >> aggregateRootClass [
	^ DWAWSAccountInAWSRegion
]

{ #category : #accessing }
DWAWSAccountInAWSRegionCreated class >> latestVersion [
	<doc: 'Retrieves the latest version of the event class'>
	^ 1
]

{ #category : #meta }
DWAWSAccountInAWSRegionCreated class >> withBuilder: aBuilder [
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withCredential;
		build: self.
	^ result
]

{ #category : #accessing }
DWAWSAccountInAWSRegionCreated >> credential [
	^ credential
]

{ #category : #accessing }
DWAWSAccountInAWSRegionCreated >> credential: anObject [
	credential := anObject
]
