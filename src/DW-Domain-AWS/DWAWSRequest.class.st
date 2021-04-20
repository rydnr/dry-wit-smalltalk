Class {
	#name : #DWAWSRequest,
	#superclass : #Object,
	#traits : 'EDATSourceCodeHelper',
	#classTraits : 'EDATSourceCodeHelper classTrait',
	#instVars : [
		'queryStringParameters',
		'headers',
		'region',
		'secretAccessKey'
	],
	#category : #'DW-Domain-AWS'
}

{ #category : #'aws protocol' }
DWAWSRequest >> action [
	self subclassResponsibility
]

{ #category : #protected }
DWAWSRequest >> addHeader: name withValue: value [
	self headers at: name put: value
]

{ #category : #protected }
DWAWSRequest >> addQueryStringParameter: name withValue: value [
	self queryStringParameters at: name put: value
]

{ #category : #'aws protocol' }
DWAWSRequest >> algorithm [
	self subclassResponsibility
]

{ #category : #'aws protocol' }
DWAWSRequest >> canonicalHeaders [
	| stream sortedHeaderNames |
	stream := WriteStream on: String new.
	sortedHeaderNames := self
		sortByCharacterCodePoint: self headers keys.
	sortedHeaderNames do: [ :n  | 
			stream
				nextPutAll: n asLowercase;
				nextPut: $:;
				nextPutAll: (self headers at: n) trimBoth;
				nextPut: Character cr ].
	^ stream contents ifEmpty: [ '' ]
]

{ #category : #'aws protocol' }
DWAWSRequest >> canonicalQueryString [
	| stream parameters sortedParameterNames |
	stream := WriteStream on: String new.
	parameters := self queryStringParameters copy.
	parameters at: 'Action' ifAbsentPut: [ self action ].
	parameters at: 'Version' ifAbsentPut: [ self version ].
	parameters at: 'X-Amz-Algorithm' ifAbsentPut: [ self version ].
	parameters at: 'X-Amz-Credential' ifAbsentPut: [ self credentialScopeValue: (self credential) ].
	parameters at: 'X-Amz-Date' ifAbsentPut: [ self date ].
	parameters at: 'X-Amz-Signature' ifAbsentPut: [ self signature ].
	parameters
		at: 'X-Amz-SignedHeaders'
		ifAbsentPut: [ self signedHeaders ].
	sortedParameterNames := self
		sortByCharacterCodePoint: parameters keys.
	sortedParameterNames
		do: [ :name | 
			stream
				nextPutAll: (self uriEncodeQueryStringParameterName: name);
				nextPut: $=;
				nextPutAll: (self uriEncodeQueryStringParameterValue: (parameters at: name)) ]
		separatedBy: [ stream nextPut: $& ].
	^ stream contents
		ifEmpty: [ '' ]
		ifNotEmpty: [ '?' , stream contents ]
]

{ #category : #'aws protocol' }
DWAWSRequest >> canonicalRequest [
	| stream |
	"From https://docs.aws.amazon.com/general/latest/gr/sigv4-create-canonical-request.html"
	stream := WriteStream on: String new.
	stream
		nextPutAll: self httpRequestMethod;
		nextPut: Character cr;
		nextPutAll: self canonicalUri;
		nextPutAll: self canonicalQueryString;
		nextPut: Character cr;
		nextPutAll: self canonicalHeaders;
		nextPutAll: self signedHeaders;
		nextPutAll: (self hexEncode: (self hash: self requestPayload)) asLowercase.
	^ stream contents
]

{ #category : #'aws protocol' }
DWAWSRequest >> canonicalUri [
	"does not work for S3, see https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-header-based-auth.html#canonical-request"

	^ self uri ifEmpty: [ '/' ] ifNotEmpty: [ self uri urlEncoded ]
]

{ #category : #'aws protocol' }
DWAWSRequest >> credential [
	| stream |
	stream := WriteStream on: String new.
	stream
		nextPutAll: self secretAccessKey greaseString;
		nextPut: $/;
		nextPutAll: self date asYYYYmmdd;
		nextPut: $/;
		nextPutAll: self region;
		nextPut: $/;
		nextPutAll: self service;
		nextPutAll: '/aws4_request'.
	^ stream contents
]

{ #category : #protected }
DWAWSRequest >> date [
	self subclassResponsibility
]

{ #category : #'aws protocol' }
DWAWSRequest >> hash: payload [
	"AWS4-HMAC-SHA256"
	self flag: #TODO.
	^ payload
]

{ #category : #accessing }
DWAWSRequest >> headers [
	^ headers ifNil: [ self headers: Dictionary new. headers ]
]

{ #category : #accessing }
DWAWSRequest >> headers: anObject [
	headers := anObject
]

{ #category : #'aws protocol' }
DWAWSRequest >> hexEncode: aString [
	^ aString asHex
]

{ #category : #accessing }
DWAWSRequest >> httpRequestMethod [
	self subclassResponsibility
]

{ #category : #accessing }
DWAWSRequest >> queryStringParameters [
	^ queryStringParameters ifNil: [ self queryStringParameters: Dictionary new. queryStringParameters ]
]

{ #category : #accessing }
DWAWSRequest >> queryStringParameters: anObject [
	queryStringParameters := anObject
]

{ #category : #accessing }
DWAWSRequest >> region [
	^ region
]

{ #category : #accessing }
DWAWSRequest >> region: anObject [
	region := anObject
]

{ #category : #accessing }
DWAWSRequest >> requestPayload [
	self subclassResponsibility 
]

{ #category : #accessing }
DWAWSRequest >> secretAccessKey [
	^ secretAccessKey
]

{ #category : #accessing }
DWAWSRequest >> secretAccessKey: anObject [
	secretAccessKey := anObject
]

{ #category : #'aws protocol' }
DWAWSRequest >> service [
	^ self subclassResponsibility 
]

{ #category : #protected }
DWAWSRequest >> signature [
	self subclassResponsibility
]

{ #category : #'aws protocol' }
DWAWSRequest >> signedHeaders [
	| stream sortedHeaderNames |
	stream := WriteStream on: String new.
	sortedHeaderNames := self sortByCharacterCodePoint: self headers keys.
	sortedHeaderNames
		do: [ :n | 
			stream
				nextPutAll: n asLowercase ] separatedBy: [ stream nextPut: $: ].
	stream nextPut: Character cr.
	^ stream contents
]

{ #category : #'aws protocol' }
DWAWSRequest >> sortByCharacterCodePoint: aCollectionOfStrings [
	self flag: #TODO.
	^ aCollectionOfStrings
]

{ #category : #'aws protocol' }
DWAWSRequest >> sortByLowercaseCharacterCode: aCollectionOfStrings [
	^ aCollectionOfStrings
]

{ #category : #'aws protocol' }
DWAWSRequest >> uri [
	self subclassResponsibility
]

{ #category : #'aws protocol' }
DWAWSRequest >> uriEncodeQueryStringParameterName: aString [
	^ aString urlEncoded
]

{ #category : #'aws protocol' }
DWAWSRequest >> uriEncodeQueryStringParameterValue: aString [
	^ self replace: '=' with: '==' inString: (self uriEncodeQueryStringParameterName: aString)
]

{ #category : #'aws protocol' }
DWAWSRequest >> version [
	self subclassResponsibility
]
