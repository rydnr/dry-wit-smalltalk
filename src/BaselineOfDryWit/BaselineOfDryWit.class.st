Class {
	#name : #BaselineOfDryWit,
	#superclass : #BaselineOf,
	#category : #BaselineOfDryWit
}

{ #category : #baselines }
BaselineOfDryWit >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			self
				declarePharoAwsToolboxIn: spec
				groups: (OrderedCollection with: 'default').
			self
				declareEDACodeMainIn: spec
				groups: (OrderedCollection with: 'default').
			self declarePackagesIn: spec.
			self declareGroupsIn: spec ]
]

{ #category : #dependencies }
BaselineOfDryWit >> declareEDACodeMainIn: spec groups: aGroupCollection [
	spec
		baseline: #EDACodeMain
		with: [ spec
				repository: 'github://edacode/edacode-main:main/src';
				loads: aGroupCollection ].
	^ spec
]

{ #category : #groups }
BaselineOfDryWit >> declareGroupsIn: spec [
	spec
		group: 'core'
			with:
			#('DW-Domain-Base' 'DW-Domain-AWS-CloudFormation' 'AWS-CloudFormation' 'DW-Domain-AWS' 'DW-Application' 'DW-Settings');
		group: 'tests'
			with: #('DW-Domain-AWS-CloudFormation-Tests' 'AWS-CloudFormation-Tests');
		group: 'default' with: #('core' 'tests')
]

{ #category : #packages }
BaselineOfDryWit >> declarePackagesIn: spec [
	spec
		package: #'DW-Domain-Base' with: [ spec requires: #('EDACodeMain') ];
		package: #'AWS-CloudFormation'
			with: [ spec requires: #('AWSToolbox') ];
		package: #'AWS-CloudFormation-Tests'
			with: [ spec requires: #('AWS-CloudFormation') ];
		package: #'DW-Domain-AWS'
			with: [ spec requires: #('DW-Domain-Base') ];
		package: #'DW-Domain-AWS-CloudFormation'
			with: [ spec
				requires: #('DW-Domain-Base' 'DW-Domain-AWS' 'AWS-CloudFormation' 'AWSToolbox') ];
		package: #'DW-Domain-AWS-CloudFormation-Tests'
			with: [ spec requires: #('DW-Domain-AWS-CloudFormation' 'DW-Domain-AWS') ];
		package: #'DW-Application'
			with: [ spec requires: #('DW-Domain-AWS') ];
					package: #'DW-Settings'
			with: [ spec requires: #('DW-Application') ]
]

{ #category : #dependencies }
BaselineOfDryWit >> declarePharoAwsToolboxIn: spec groups: aGroupCollection [
	spec
		baseline: 'AWSToolbox'
		with: [ spec
				repository: 'github://rydnr/pharo-aws-toolbox:master/repository';
				loads: aGroupCollection ].
	^ spec
]
