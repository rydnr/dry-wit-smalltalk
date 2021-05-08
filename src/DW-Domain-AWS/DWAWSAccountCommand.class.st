Class {
	#name : #DWAWSAccountCommand,
	#superclass : #DWUserCommand,
	#instVars : [
		'accountId',
		'region'
	],
	#category : #'DW-Domain-AWS'
}

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

{ #category : #accessing }
DWAWSAccountCommand >> region [
	^ region
]

{ #category : #accessing }
DWAWSAccountCommand >> region: anObject [
	region := anObject
]
