Class {
	#name : #AWSCloudFormationValidateTemplateResponseTest,
	#superclass : #TestCase,
	#category : #'AWS-CloudFormation-Tests'
}

{ #category : #tests }
AWSCloudFormationValidateTemplateResponseTest >> testParseListExportsResponse [
	| input response |
	input := '<ValidateTemplateResponse xmlns="http://cloudformation.amazonaws.com/doc/2010-05-15/">
  <ValidateTemplateResult>
    <Description></Description>
    <Parameters>
      <member>
        <NoEcho>false</NoEcho>
        <ParameterKey>InstanceType</ParameterKey>
        <Description>Type of instance to launch</Description>
        <DefaultValue>m1.small</DefaultValue>
      </member>
      <member>
        <NoEcho>false</NoEcho>
        <ParameterKey>WebServerPort</ParameterKey>
        <Description>The TCP port for the Web Server</Description>
        <DefaultValue>8888</DefaultValue>
      </member>
      <member>
        <NoEcho>false</NoEcho>
        <ParameterKey>KeyName</ParameterKey>
        <Description>Name of an existing EC2 KeyPair to enable SSH access into the server</Description>
      </member>
    </Parameters>
  </ValidateTemplateResult>
  <ResponseMetadata>
    <RequestId>0be7b6e8-e4a0-11e0-a5bd-example</RequestId>
  </ResponseMetadata>
</ValidateTemplateResponse>'.
	response := AWSCloudFormationValidateTemplateResponse
		fromXmlString: input.
	self assert: response description equals: ''.
	self
		assert: response parameters
		equals:
			(Array
				with:
					(AWSCloudFormationStackParameter new
						parameterKey: 'InstanceType';
						description: 'Type of instance to launch';
						defaultValue: 'm1.small';
						noEcho: false;
						yourself)
				with:
					(AWSCloudFormationStackParameter new
						parameterKey: 'WebServerPort';
						description: 'The TCP port for the Web Server';
						defaultValue: '8888';
						noEcho: false;
						yourself)
				with:
					(AWSCloudFormationStackParameter new
						parameterKey: 'KeyName';
						description: 'Name of an existing EC2 KeyPair to enable SSH access into the server';
						noEcho: false;
						yourself)).
	self
		assert: response requestId
		equals: '0be7b6e8-e4a0-11e0-a5bd-example'
]
