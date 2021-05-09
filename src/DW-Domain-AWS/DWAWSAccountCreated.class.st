Class {
	#name : #DWAWSAccountCreated,
	#superclass : #DWAWSAccountEvent,
	#category : #'DW-Domain-AWS'
}

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
