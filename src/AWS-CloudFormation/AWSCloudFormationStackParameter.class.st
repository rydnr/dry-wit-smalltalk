Class {
	#name : #AWSCloudFormationStackParameter,
	#superclass : #Object,
	#instVars : [
		'defaultValue',
		'description',
		'noEcho',
		'parameterKey'
	],
	#category : #'AWS-CloudFormation'
}

{ #category : #comparing }
AWSCloudFormationStackParameter >> = anObject [
	^ ((anObject respondsTo: #defaultValue )
		and: [ (anObject respondsTo: #description)
				and: [ (anObject respondsTo: #noEcho)
						and: [ (anObject respondsTo: #parameterKey) ] ] ])
		ifTrue: [ self defaultValue = anObject defaultValue
				and: [ self description = anObject description
						and: [ self noEcho = anObject noEcho
								and: [ self parameterKey = anObject parameterKey ] ] ] ]
		ifFalse: [ false ]
]

{ #category : #accessing }
AWSCloudFormationStackParameter >> defaultValue [
	^ defaultValue ifNil: [ '' ]
]

{ #category : #accessing }
AWSCloudFormationStackParameter >> defaultValue: anObject [
	defaultValue := anObject
]

{ #category : #accessing }
AWSCloudFormationStackParameter >> description [
	^ description
]

{ #category : #accessing }
AWSCloudFormationStackParameter >> description: anObject [
	description := anObject
]

{ #category : #accessing }
AWSCloudFormationStackParameter >> noEcho [
	^ noEcho
]

{ #category : #accessing }
AWSCloudFormationStackParameter >> noEcho: anObject [
	noEcho := anObject
]

{ #category : #accessing }
AWSCloudFormationStackParameter >> parameterKey [
	^ parameterKey
]

{ #category : #accessing }
AWSCloudFormationStackParameter >> parameterKey: anObject [
	parameterKey := anObject
]
