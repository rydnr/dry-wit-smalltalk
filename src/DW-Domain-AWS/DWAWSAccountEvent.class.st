Class {
	#name : #DWAWSAccountEvent,
	#superclass : #DWEventSourcingEvent,
	#instVars : [
		'accountId',
		'credentials'
	],
	#category : #'DW-Domain-AWS'
}

{ #category : #meta }
DWAWSAccountEvent class >> aggregateRootClass [
	^ DWAWSAccount
]

{ #category : #testing }
DWAWSAccountEvent class >> isAbstract [
	^ true
]

{ #category : #accessing }
DWAWSAccountEvent >> accountId [
	^ accountId
]

{ #category : #accessing }
DWAWSAccountEvent >> accountId: anObject [
	accountId := anObject
]

{ #category : #accessing }
DWAWSAccountEvent >> credentials [
	^ credentials
]

{ #category : #accessing }
DWAWSAccountEvent >> credentials: anObject [
	credentials := anObject
]
