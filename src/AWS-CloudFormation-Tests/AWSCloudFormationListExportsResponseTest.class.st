Class {
	#name : #AWSCloudFormationListExportsResponseTest,
	#superclass : #TestCase,
	#category : #'AWS-CloudFormation-Tests'
}

{ #category : #tests }
AWSCloudFormationListExportsResponseTest >> testParseListExportsResponse [
	| input response |
	input := '<ListExportsResponse xmlns="http://cloudformation.amazonaws.com/doc/2010-05-15/">
  <ListExportsResult>
    <Exports>
      <member>
        <Name>mySampleStack1-SecurityGroupID</Name>
        <ExportingStackId>arn:aws:cloudformation:us-east-1:123456789012:stack/mySampleStack1/12a3b456-0e10-4ce0-9052-5d484a8c4e5b</ExportingStackId>
        <Value>sg-0a123b45</Value>
      </member>
      <member>
        <Name>mySampleStack1-SubnetID</Name>
        <ExportingStackId>arn:aws:cloudformation:us-east-2:123456789012:stack/mySampleStack1/12a3b456-0e10-4ce0-9052-5d484a8c4e5b</ExportingStackId>
        <Value>subnet-0a123b45</Value>
      </member>
      <member>
        <Name>mySampleStack1-VPCID</Name>
        <ExportingStackId>arn:aws:cloudformation:eu-east-1:123456789012:stack/mySampleStack1/12a3b456-0e10-4ce0-9052-5d484a8c4e5b</ExportingStackId>
        <Value>vpc-0a123b45</Value>
      </member>
      <member>
        <Name>WebSiteURL</Name>
        <ExportingStackId>arn:aws:cloudformation:us-east-1:123456789012:stack/myS3StaticSite/12a3b456-0e10-4ce0-9052-5d484a8c4e5b</ExportingStackId>
        <Value>http://testsite.com.s3-website-us-east-1.amazonaws.com</Value>
      </member>
    </Exports>
  </ListExportsResult>
  <ResponseMetadata>
    <RequestId>5ccc7dcd-744c-11e5-be70-1b08c228efb3</RequestId>
  </ResponseMetadata>
</ListExportsResponse>'.
	response := AWSCloudFormationListExportsResponse fromXmlString: input.
	self
		assert: response exports
		equals:
			(Array
				with:
					(AWSCloudFormationExport
						name: 'mySampleStack1-SecurityGroupID'
						exportingStackId:
							'arn:aws:cloudformation:us-east-1:123456789012:stack/mySampleStack1/12a3b456-0e10-4ce0-9052-5d484a8c4e5b'
						value: 'sg-0a123b45')
				with:
					(AWSCloudFormationExport
						name: 'mySampleStack1-SubnetID'
						exportingStackId:
							'arn:aws:cloudformation:us-east-2:123456789012:stack/mySampleStack1/12a3b456-0e10-4ce0-9052-5d484a8c4e5b'
						value: 'subnet-0a123b45')
				with:
					(AWSCloudFormationExport
						name: 'mySampleStack1-VPCID'
						exportingStackId:
							'arn:aws:cloudformation:eu-east-1:123456789012:stack/mySampleStack1/12a3b456-0e10-4ce0-9052-5d484a8c4e5b'
						value: 'vpc-0a123b45')
				with:
					(AWSCloudFormationExport
						name: 'WebSiteURL'
						exportingStackId:
							'arn:aws:cloudformation:us-east-1:123456789012:stack/myS3StaticSite/12a3b456-0e10-4ce0-9052-5d484a8c4e5b'
						value: 'http://testsite.com.s3-website-us-east-1.amazonaws.com')).
	self
		assert: response requestId
		equals: '5ccc7dcd-744c-11e5-be70-1b08c228efb3'
]
