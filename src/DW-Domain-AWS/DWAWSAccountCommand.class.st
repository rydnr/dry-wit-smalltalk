Class {
	#name : #DWAWSAccountCommand,
	#superclass : #DWUserCommand,
	#instVars : [
		'accountId',
		'region'
	],
	#category : #'DW-Domain-AWS'
}

{ #category : #meta }
DWAWSAccountCommand class >> aggregateRootClass [
	^ DWAWSAccount
]

{ #category : #testing }
DWAWSAccountCommand class >> isAbstract [
	^ true
]

{ #category : #'instance creation' }
DWAWSAccountCommand class >> withAccountId: anAccountId andRegion: aString [
	^ self new accountId: anAccountId; region: aString; yourself
]

{ #category : #accessing }
DWAWSAccountCommand >> accountId [
	^ accountId
]

{ #category : #accessing }
DWAWSAccountCommand >> accountId: anObject [
	accountId := anObject
]

{ #category : #'aggregate selection' }
DWAWSAccountCommand >> aggregateSelectionCriteria [
	^ Dictionary with: 'accountId' -> self accountId
]

{ #category : #accessing }
DWAWSAccountCommand >> region [
	^ region
]

{ #category : #accessing }
DWAWSAccountCommand >> region: anObject [
	region := anObject
]
