Extension { #name : #DWAWSAccount }

{ #category : #'*DW-Domain-AWS-CloudFormation' }
DWAWSAccount >> handleListExports: aCommand [
	<useAsCommandHandlerFor: #DWAWSListExports>
	| client output |
	client := DWAWSListExportsClient
		withCredential: self credential
		andRegion: aCommand region.
	output := client request.
	^ DWAWSExportsRetrieved withBuilder: (EDABuilder with: output)
]
