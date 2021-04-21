Class {
	#name : #AWSCloudFormationStackSummary,
	#superclass : #Object,
	#instVars : [
		'stackId',
		'stackStatus',
		'deletionTime',
		'stackName',
		'creationTime',
		'templateDescription',
		'resourceTypes'
	],
	#category : #'AWS-CloudFormation'
}

{ #category : #comparing }
AWSCloudFormationStackSummary >> = anObject [
	^ ((anObject respondsTo: #stackId)
		and: [ (anObject respondsTo: #stackStatus)
				and: [ (anObject respondsTo: #deletionTime)
						and: [ (anObject respondsTo: #stackName)
								and: [ (anObject respondsTo: #creationTime)
										and: [ (anObject respondsTo: #templateDescription)
												and: [ anObject respondsTo: #resourceTypes ] ] ] ] ] ])
		ifTrue: [ self stackId = anObject stackId
				and: [ self stackStatus = anObject stackStatus
						and: [ self deletionTime = anObject deletionTime and: [ self stackName = anObject stackName and: [ self creationTime = anObject creationTime and: [ self templateDescription = anObject templateDescription and: [ self resourceTypes = anObject resourceTypes ] ] ] ] ] ] ]
		ifFalse: [ false ]
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> creationTime [
	^ creationTime
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> creationTime: anObject [
	creationTime := anObject
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> deletionTime [
	^ deletionTime ifNil: [ '' ]
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> deletionTime: anObject [
	deletionTime := anObject
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> initialize [
	super initialize.
	self deletionTime: ''
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> resourceTypes [
	^ resourceTypes
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> resourceTypes: anObject [
	resourceTypes := anObject
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> stackId [
	^ stackId
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> stackId: anObject [
	stackId := anObject greaseString trim
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> stackName [
	^ stackName
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> stackName: anObject [
	stackName := anObject
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> stackStatus [
	^ stackStatus
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> stackStatus: anObject [
	stackStatus := anObject
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> templateDescription [
	^ templateDescription
]

{ #category : #accessing }
AWSCloudFormationStackSummary >> templateDescription: anObject [
	templateDescription := anObject greaseString trim
]
