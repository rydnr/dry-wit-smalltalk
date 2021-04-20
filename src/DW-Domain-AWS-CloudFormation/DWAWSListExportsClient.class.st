Class {
	#name : #DWAWSListExportsClient,
	#superclass : #Object,
	#instVars : [
		'accessKeyId',
		'secretAccessKey',
		'region'
	],
	#category : #'DW-Domain-AWS-CloudFormation-Exports-Client'
}

{ #category : #'instance creation' }
DWAWSListExportsClient class >> withCredential: aString andRegion: aRegion [
	^ self new credential: aString; region: aRegion; yourself
]

{ #category : #accessing }
DWAWSListExportsClient >> accessKeyId [
	^ accessKeyId
]

{ #category : #accessing }
DWAWSListExportsClient >> accessKeyId: anObject [
	accessKeyId := anObject
]

{ #category : #accessing }
DWAWSListExportsClient >> region [
	^ region
]

{ #category : #accessing }
DWAWSListExportsClient >> region: anObject [
	region := anObject
]

{ #category : #accessing }
DWAWSListExportsClient >> request [
	| request |
	request := DWAWSListExportsRequest
		withAccessKeyId: self accessKeyId
		secretAccessKey: self secretAccessKey
		andRegion: self region.
	^ ZnClient new
		url: request canonicalRequest get;
		response
]

{ #category : #accessing }
DWAWSListExportsClient >> secretAccessKey [
	^ secretAccessKey
]

{ #category : #accessing }
DWAWSListExportsClient >> secretAccessKey: anObject [
	secretAccessKey := anObject
]
