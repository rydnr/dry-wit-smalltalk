Class {
	#name : #DWAWSAccount,
	#superclass : #DWAggregateRoot,
	#instVars : [
		'credentials'
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
	self credentials: anEvent credentials
]

{ #category : #accessing }
DWAWSAccount >> credentials [
	^ credentials
]

{ #category : #accessing }
DWAWSAccount >> credentials: anObject [
	credentials := anObject
]
