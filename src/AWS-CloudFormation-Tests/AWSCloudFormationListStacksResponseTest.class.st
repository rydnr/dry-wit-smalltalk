Class {
	#name : #AWSCloudFormationListStacksResponseTest,
	#superclass : #TestCase,
	#category : #'AWS-CloudFormation-Tests'
}

{ #category : #tests }
AWSCloudFormationListStacksResponseTest >> testParseListExportsResponse [
	| input response |
	input := '<ListStacksResponse xmlns="http://cloudformation.amazonaws.com/doc/2010-05-15/">
  <ListStacksResult>
    <StackSummaries>
      <member>
        <StackId>
          arn:aws:cloudformation:us-east-1:1234567:stack/TestCreate1/aaaaa
        </StackId>
        <StackStatus>CREATE_IN_PROGRESS</StackStatus>
        <StackName>vpc1</StackName>
        <CreationTime>2011-05-23T15:47:44Z</CreationTime>
        <TemplateDescription>
          Creates one EC2 instance and a load balancer.
        </TemplateDescription>
        <ResourceTypes>
          <member>AWS::EC2::Instance</member>
          <member>AWS::ElasticLoadBalancing::LoadBalancer</member>
        </ResourceTypes>
      </member>
      <member>
        <StackId>
          arn:aws:cloudformation:us-east-1:1234567:stack/TestDelete2/bbbbb
        </StackId>
        <StackStatus>DELETE_COMPLETE</StackStatus>
        <DeletionTime>2011-03-10T16:20:51Z</DeletionTime>
        <StackName>WP1</StackName>
        <CreationTime>2011-03-05T19:57:58Z</CreationTime>
        <TemplateDescription>
          A simple basic Cloudformation Template.
        </TemplateDescription>
        <ResourceTypes>
          <member>AWS::EC2::Instance</member>
        </ResourceTypes>
      </member>
    </StackSummaries>
  </ListStacksResult>
  <ResponseMetadata>
    <RequestId>b9b4b068-3a41-11e5-94eb-example</RequestId>
  </ResponseMetadata>
</ListStacksResponse>'.
	response := AWSCloudFormationListStacksResponse fromXmlString: input.
	self
		assert: response stackSummaries
		equals:
			(Array
				with:
					(AWSCloudFormationStackSummary new
						stackId: 'arn:aws:cloudformation:us-east-1:1234567:stack/TestCreate1/aaaaa';
						stackStatus: 'CREATE_IN_PROGRESS';
						stackName: 'vpc1';
						creationTime: '2011-05-23T15:47:44Z';
						templateDescription: 'Creates one EC2 instance and a load balancer.';
						resourceTypes: (Array with: 'AWS::EC2::Instance' with: 'AWS::ElasticLoadBalancing::LoadBalancer'); yourself)
				with:
					(AWSCloudFormationStackSummary new
						stackId: 'arn:aws:cloudformation:us-east-1:1234567:stack/TestDelete2/bbbbb';
						stackStatus: 'DELETE_COMPLETE';
						deletionTime: '2011-03-10T16:20:51Z';
						stackName: 'WP1';
						creationTime: '2011-03-05T19:57:58Z';
						templateDescription: 'A simple basic Cloudformation Template.';
						resourceTypes: (Array with: 'AWS::EC2::Instance'); yourself)).
	self
		assert: response requestId
		equals: 'b9b4b068-3a41-11e5-94eb-example'
]
