Class {
	#name : #DWAWSAccount,
	#superclass : #DWAggregateRoot,
	#instVars : [
		'credential'
	],
	#category : #'DW-Domain-AWS'
}

{ #category : #'instance creation' }
DWAWSAccount class >> withBuilder: aBuilder [
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withCredential;
		build: self.
	^ result
]

{ #category : #'event handling' }
DWAWSAccount >> applyAWSAccountCreatedv1: anEvent [
	self tenant: anEvent tenant.
	self credential: anEvent credential
]

{ #category : #accessing }
DWAWSAccount >> credential [
	^ credential
]

{ #category : #accessing }
DWAWSAccount >> credential: anObject [
	credential := anObject
]
