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

{ #category : #initialization }
AWSCloudFormationListExportsResponse >> initFromXmlElement: rootElement [
	resultXml := rootElement elements first.
	metadataXml := rootElement elementAt: 'ResponseMetadata'
]

{ #category : #accessing }
AWSCloudFormationListExportsResponse >> metadataXml [
	^ metadataXml
]

{ #category : #accessing }
AWSCloudFormationListExportsResponse >> requestId [
	^ self metadataXml contentStringAt: 'RequestId'
]

{ #category : #accessing }
AWSCloudFormationListExportsResponse >> resultXml [
	^ resultXml
]
