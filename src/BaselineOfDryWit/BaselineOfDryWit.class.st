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
				declarePharoEDAIn: spec
				groups: (OrderedCollection with: 'default').
			self declarePackagesIn: spec.
			self declareGroupsIn: spec ]
]

{ #category : #groups }
BaselineOfDryWit >> declareGroupsIn: spec [
	spec
		group: 'core'
			with: #('DW-Domain-Base' 'DW-Domain-AWS-CloudFormation' 'DW-Domain-AWS' 'DW-Application');
		group: 'tests' with: #('DW-Domain-AWS-CloudFormation-Tests');
		group: 'default' with: #('core' 'tests')
]

{ #category : #packages }
BaselineOfDryWit >> declarePackagesIn: spec [
	spec
		package: #'DW-Domain-Base' with: [ spec requires: #('PharoEDA') ];
		package: #'DW-Domain-AWS-CloudFormation'
			with: [ spec requires: #('DW-Domain-Base' 'AWSToolbox') ];
		package: #'DW-Domain-AWS'
			with: [ spec requires: #('DW-Domain-AWS-CloudFormation') ];
		package: #'DW-Domain-AWS-CloudFormation-Tests'
			with: [ spec requires: #('DW-Domain-AWS-CloudFormation' 'DW-Domain-AWS') ];
		package: #'DW-Application' with: [ spec requires: #('DW-Domain-AWS') ]
]

{ #category : #dependencies }
BaselineOfDryWit >> declarePharoAwsToolboxIn: spec groups: aGroupCollection [
	spec
		baseline: 'AWSToolbox'
		with: [ spec
				repository: 'github://jvdsandt/pharo-aws-toolbox:master/repository';
				loads: aGroupCollection ].
	^ spec
]

{ #category : #dependencies }
BaselineOfDryWit >> declarePharoEDAIn: spec groups: aGroupCollection [
	spec
		baseline: 'PharoEDA'
		with: [ spec
				repository: 'github://osoco/pharo-eda:event-listening/src';
				loads: aGroupCollection ].
	^ spec
]
