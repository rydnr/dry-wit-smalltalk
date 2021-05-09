Trait {
	#name : #DWAWSTIntegrationTest,
	#traits : 'EDATDomainBDD',
	#classTraits : 'EDATDomainBDD classTrait',
	#category : #'DW-Domain-AWS-CloudFormation-Tests'
}

{ #category : #accessing }
DWAWSTIntegrationTest classSide >> credentials [
	^ AWSIntegrationTestResource current credentials
]

{ #category : #accessing }
DWAWSTIntegrationTest classSide >> resources [
	^ Array with: AWSIntegrationTestResource
]

{ #category : #accessing }
DWAWSTIntegrationTest >> credentials [
	^ self class credentials
]
