Class {
	#name : #AWSCloudFormationService,
	#superclass : #AWSService,
	#traits : 'AWSTXmlErrorResponseHandler + AWSTFormUrlEncoding',
	#classTraits : 'AWSTXmlErrorResponseHandler classTrait + AWSTFormUrlEncoding classTrait',
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

{ #category : #api }
AWSCloudFormationService >> listStacks [
	| url httpRequest response |
	url := self endpoint asZnUrl.
	url queryAt: 'Action' put: 'ListStacks'.
	url queryAt: 'Version' put: '2010-05-15'.
	httpRequest := ZnRequest get: url.
	self signRequest: httpRequest.
	response := self httpClient
		request: httpRequest;
		execute;
		response.
	response isSuccess
		ifFalse: [ self handleErrorResponse: response ].
	^ AWSCloudFormationListStacksResponse
		fromXmlString: response contents
]

{ #category : #api }
AWSCloudFormationService >> validateTemplate: aFileReference [
	| httpRequest response client entity |
	client := ZnClient new.
	client url: self endpoint asZnUrl.
	entity := self 
		convertEntity:
			(ZnApplicationFormUrlEncodedEntity
				withAll:
					(Dictionary new
						add: 'Action' -> 'ValidateTemplate';
						add: 'Version' -> '2010-05-15';
						add: 'TemplateBody' -> aFileReference contents;
						yourself)).
	client entity: entity.
	client method: #POST.
	httpRequest := client request.
	self signRequest: httpRequest.
	response := self httpClient
		request: httpRequest;
		execute;
		response.
	response isSuccess
		ifFalse: [ self handleErrorResponse: response ].
	^ AWSCloudFormationListStacksResponse
		fromXmlString: response contents
]
