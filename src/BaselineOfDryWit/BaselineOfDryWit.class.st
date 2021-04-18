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
				declarePharoEDAIn: spec
				groups: (OrderedCollection with: 'default').
			self declarePackagesIn: spec.
			self declareGroupsIn: spec ]

]

{ #category : #groups }
BaselineOfDryWit >> declareGroupsIn: spec [
			spec
				group: 'core'
					with:
					#('DW-Domain');
				group: 'tests'
					with:
					#('DW-Domain-Tests');
				group: 'default'
					with: #('core' 'tests')

]

{ #category : #packages }
BaselineOfDryWit >> declarePackagesIn: spec [
	spec
		package: #'DW-Domain' with: [ spec requires: #('PharoEDA') ];
		package: #'DW-Domain-Tests'
			with: [ spec requires: #('DW-Domain') ]

]

{ #category : #dependencies }
BaselineOfDryWit >> declarePharoEDAIn: spec groups: aGroupCollection [
	spec
		baseline: 'PharoEDA'
		with: [ spec
				repository: 'github://osoco/pharo-eda:develop/src';
				loads: aGroupCollection ].
	^ spec

]
