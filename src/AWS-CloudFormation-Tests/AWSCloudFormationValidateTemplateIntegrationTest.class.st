Class {
	#name : #AWSCloudFormationValidateTemplateIntegrationTest,
	#superclass : #AWSCloudFormationIntegrationTest,
	#category : #'AWS-CloudFormation-Tests'
}

{ #category : #tests }
AWSCloudFormationValidateTemplateIntegrationTest >> testValidateTemplate [
	| response |
	response := self cloudformationService
		validateTemplate:
			FileSystem workingDirectory / 'tests' / 'aws-cloudformation'
				/ 'validate-template.json'.
	self assert: response notNil
]
