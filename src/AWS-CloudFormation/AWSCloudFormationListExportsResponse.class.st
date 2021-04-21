Class {
	#name : #AWSCloudFormationListExportsResponse,
	#superclass : #AWSCloudFormationResponse,
	#category : #'AWS-CloudFormation'
}

{ #category : #accessing }
AWSCloudFormationListExportsResponse >> exports [
	^ (((self resultXml elementAt: 'Exports') elementsAt: 'member')
		collect:
			[ :each | AWSCloudFormationExport name: (each contentStringAt: 'Name') exportingStackId: (each contentStringAt: 'ExportingStackId') value: (each contentStringAt: 'Value')])
		asArray
]
