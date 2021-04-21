Class {
	#name : #AWSCloudFormationExport,
	#superclass : #Object,
	#instVars : [
		'name',
		'exportingStackId',
		'value'
	],
	#category : #'AWS-CloudFormation'
}

{ #category : #'instance creation' }
AWSCloudFormationExport class >> name: aName exportingStackId: anId value: aValue [
	^ self new name: aName; exportingStackId: anId; value: aValue; yourself
]

{ #category : #comparing }
AWSCloudFormationExport >> = anObject [
	^ ((anObject respondsTo: #name)
		and: [ anObject respondsTo: #exportingStackId ])
		ifTrue: [ self name = anObject name
				and: [ self exportingStackId = anObject exportingStackId
						and: [ self value = anObject value ] ] ]
		ifFalse: [ false ]
]

{ #category : #accessing }
AWSCloudFormationExport >> exportingStackId [
	^ exportingStackId
]

{ #category : #accessing }
AWSCloudFormationExport >> exportingStackId: anObject [
	exportingStackId := anObject
]

{ #category : #accessing }
AWSCloudFormationExport >> name [
	^ name
]

{ #category : #accessing }
AWSCloudFormationExport >> name: anObject [
	name := anObject
]

{ #category : #accessing }
AWSCloudFormationExport >> value [
	^ value
]

{ #category : #accessing }
AWSCloudFormationExport >> value: anObject [
	value := anObject
]
