Class {
	#name : #AWSCloudFormationValidateTemplateResponse,
	#superclass : #AWSCloudFormationResponse,
	#category : #'AWS-CloudFormation'
}

{ #category : #accessing }
AWSCloudFormationValidateTemplateResponse >> capabilities [
	^ self shouldBeImplemented 
]

{ #category : #accessing }
AWSCloudFormationValidateTemplateResponse >> capabilitiesReason [
	^ self shouldBeImplemented 
]

{ #category : #accessing }
AWSCloudFormationValidateTemplateResponse >> declaredTransforms [
	^ self shouldBeImplemented 
]

{ #category : #accessing }
AWSCloudFormationValidateTemplateResponse >> description [
	^ ((self resultXml contentStringAt: 'Description') ifNil: [ '' ]) trim
]

{ #category : #accessing }
AWSCloudFormationValidateTemplateResponse >> parameters [
	^ (((self resultXml elementAt: 'Parameters') elementsAt: 'member')
		collect: [ :each | 
			AWSCloudFormationStackParameter new
				parameterKey: (each contentStringAt: 'ParameterKey');
				description: (each contentStringAt: 'Description');
				defaultValue: (each contentStringAt: 'DefaultValue');
				noEcho: (each contentStringAt: 'NoEcho') = true greaseString ])
		asArray
]

{ #category : #accessing }
AWSCloudFormationValidateTemplateResponse >> result [
	| result validateTemplateResult |
	validateTemplateResult := self resultXml elementAt: 'ValidateTemplateResult'.
	result := AWSCloudFormationValidateTemplateResult new.
	result description: ((validateTemplateResult elementAt: 'Description') ifNil: [ '' ]) trim.
	(((validateTemplateResult elementAt: 'Parameters') elementsAt: 'member')
		collect: [ :each | 
			result addParameter: (
			AWSCloudFormationStackParameter new
				parameterKey: (each contentStringAt: 'ParameterKey');
				description: (each contentStringAt: 'Description');
				defaultValue: (each contentStringAt: 'DefaultValue');
				noEcho: (each contentStringAt: 'NoEcho') = true greaseString) ]).
	^ result
	
]
