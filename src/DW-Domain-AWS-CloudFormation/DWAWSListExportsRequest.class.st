Class {
	#name : #DWAWSListExportsRequest,
	#superclass : #DWAWSRequest,
	#category : #'DW-Domain-AWS-CloudFormation-Exports-Client'
}

{ #category : #'aws protocol' }
DWAWSListExportsRequest class >> service [ 
	^ 'cloudformation'
]

{ #category : #initialization }
DWAWSListExportsRequest >> action [
	^ 'ListExports'
]

{ #category : #initialization }
DWAWSListExportsRequest >> algorithm [
	^ 'AWS4-HMAC-SHA256'

]

{ #category : #accessing }
DWAWSListExportsRequest >> credential: aString [
	super credential: aString.
	self
		addQueryStringParameter: 'X-Amz-Credential' 	withValue: aString greaseString

]

{ #category : #initialization }
DWAWSListExportsRequest >> date [
	^ '20160316T233349Z'
]

{ #category : #initialization }
DWAWSListExportsRequest >> doInitialize [
	self
		addQueryStringParameter: 'Action' withValue: 'ListExports';
		addQueryStringParameter: 'Version' withValue: '2010-05-15';
		addQueryStringParameter: 'X-Amz-Algorithm'
			withValue: 'AWS4-HMAC-SHA256';
		addQueryStringParameter: 'X-Amz-Date' withValue: '20160316T233349Z'
]

{ #category : #initialization }
DWAWSListExportsRequest >> httpRequestMethod [
	^ 'GET'
]

{ #category : #initialization }
DWAWSListExportsRequest >> initialize [
	super initialize.
	self doInitialize
]

{ #category : #accessing }
DWAWSListExportsRequest >> region: aString [
	super region: aString.
	self
		addHeader: 'host'
		withValue: 'cloudformation.' , aString greaseString , '.amazonaws.com'
]

{ #category : #accessing }
DWAWSListExportsRequest >> requestPayload [
	^ ''
]

{ #category : #protected }
DWAWSListExportsRequest >> service [
	^ self class service
]

{ #category : #protected }
DWAWSListExportsRequest >> signature [
	self flag: #TODO.
	^ ''
]

{ #category : #initialization }
DWAWSListExportsRequest >> uri [
	^ ''
]

{ #category : #initialization }
DWAWSListExportsRequest >> version [
	^ '2010-05-15'
]
