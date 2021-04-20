Class {
	#name : #DWAWSCloudFormationExport,
	#superclass : #Object,
	#instVars : [
		'name',
		'exportingStackId',
		'value'
	],
	#category : #'DW-Domain-AWS-CloudFormation-Exports'
}

{ #category : #'instance creation' }
DWAWSCloudFormationExport class >> withBuilder: aBuilder [
	^ aBuilder withName; withExportingStackId; withValue; build: self
]

{ #category : #accessing }
DWAWSCloudFormationExport >> exportingStackId [
	^ exportingStackId
]

{ #category : #accessing }
DWAWSCloudFormationExport >> exportingStackId: anObject [
	exportingStackId := anObject
]

{ #category : #accessing }
DWAWSCloudFormationExport >> name [
	^ name
]

{ #category : #accessing }
DWAWSCloudFormationExport >> name: anObject [
	name := anObject
]

{ #category : #accessing }
DWAWSCloudFormationExport >> value [
	^ value
]

{ #category : #accessing }
DWAWSCloudFormationExport >> value: anObject [
	value := anObject
]
