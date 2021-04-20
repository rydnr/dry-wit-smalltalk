Class {
	#name : #DWAWSStackCreated,
	#superclass : #DWEventSourcingEvent,
	#instVars : [
		'physicalResourceId',
		'stackName',
		'eventId',
		'stackId',
		'logicalResourceId'
	],
	#category : #'DW-Domain-AWS-CloudFormation-Stacks'
}

{ #category : #meta }
DWAWSStackCreated class >> aggregateRootClass [
	^ DWAWSStack
]

{ #category : #accessing }
DWAWSStackCreated class >> latestVersion [
	<doc: 'Retrieves the latest version of the event class'>
	^ 1
]

{ #category : #'instance creation' }
DWAWSStackCreated class >> withBuilder: aBuilder [
	<eventName: #STACK_CREATED>
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withStackId;
		withEventId;
		withLogicalResourceId;
		withStackName;
		withPhysicalResourceId;
		build: self.
	^ result
]

{ #category : #accessing }
DWAWSStackCreated >> eventId [
	^ eventId
]

{ #category : #accessing }
DWAWSStackCreated >> eventId: anObject [
	eventId := anObject
]

{ #category : #accessing }
DWAWSStackCreated >> logicalResourceId [
	^ logicalResourceId
]

{ #category : #accessing }
DWAWSStackCreated >> logicalResourceId: anObject [
	logicalResourceId := anObject
]

{ #category : #accessing }
DWAWSStackCreated >> physicalResourceId [
	^ physicalResourceId
]

{ #category : #accessing }
DWAWSStackCreated >> physicalResourceId: anObject [
	physicalResourceId := anObject
]

{ #category : #accessing }
DWAWSStackCreated >> stackId [
	^ stackId
]

{ #category : #accessing }
DWAWSStackCreated >> stackId: anObject [
	stackId := anObject
]

{ #category : #accessing }
DWAWSStackCreated >> stackName [
	^ stackName
]

{ #category : #accessing }
DWAWSStackCreated >> stackName: anObject [
	stackName := anObject
]
