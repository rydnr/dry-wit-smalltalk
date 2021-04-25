Class {
	#name : #DWAWSExport,
	#superclass : #Object,
	#instVars : [
		'name',
		'exportingStackId',
		'value'
	],
	#category : #'DW-Domain-AWS-CloudFormation-Exports'
}

{ #category : #'instance creation' }
DWAWSExport class >> withBuilder: aBuilder [
	^ aBuilder withName; withExportingStackId; withValue; build: self
]

{ #category : #accessing }
DWAWSExport >> exportingStackId [
	^ exportingStackId
]

{ #category : #accessing }
DWAWSExport >> exportingStackId: anObject [
	exportingStackId := anObject
]

{ #category : #accessing }
DWAWSExport >> name [
	^ name
]

{ #category : #accessing }
DWAWSExport >> name: anObject [
	name := anObject
]

{ #category : #accessing }
DWAWSExport >> value [
	^ value
]

{ #category : #accessing }
DWAWSExport >> value: anObject [
	value := anObject
]
