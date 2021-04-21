Class {
	#name : #AWSCloudFormationService,
	#superclass : #AWSService,
	#traits : 'AWSTXmlErrorResponseHandler',
	#classTraits : 'AWSTXmlErrorResponseHandler classTrait',
	#category : #'AWS-CloudFormation'
}

{ #category : #initialization }
AWSCloudFormationService >> initEndpointWithRegion: aRegion [
	endpoint := 'https://cloudformation.' , region asLowercase , '.amazonaws.com'
]

{ #category : #api }
AWSCloudFormationService >> listExports [
	| url httpRequest response |
	url := self endpoint asZnUrl.
	url queryAt: 'Action' put: 'ListExports'.
	url queryAt: 'Version' put: '2010-05-15'.
	httpRequest := ZnRequest get: url.
	self signRequest: httpRequest.
	response := self httpClient
		request: httpRequest;
		execute;
		response.
	response isSuccess
		ifFalse: [ self handleErrorResponse: response ].
	^ AWSCloudFormationListExportsResponse
		fromXmlString: response contents
]
