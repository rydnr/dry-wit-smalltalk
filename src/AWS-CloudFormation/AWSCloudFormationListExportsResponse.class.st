Class {
	#name : #AWSCloudFormationListExportsResponse,
	#superclass : #AWSCloudFormationResponse,
	#instVars : [
		'exports'
	],
	#category : #'AWS-CloudFormation'
}

{ #category : #accessing }
AWSCloudFormationListExportsResponse >> exports [
	^ exports
]

{ #category : #accessing }
AWSCloudFormationListExportsResponse >> exports: aCollection [
	exports := aCollection
]

{ #category : #initialization }
AWSCloudFormationListExportsResponse >> initFromXmlElement: rootElement [
	super initFromXmlElement: rootElement.
	self exports: self parseExports
]

{ #category : #protected }
AWSCloudFormationListExportsResponse >> parseExports [
	^ (((self resultXml elementAt: 'Exports') elementsAt: 'member')
		collect: [ :each | 
			AWSCloudFormationExport
				name: (each contentStringAt: 'Name')
				exportingStackId: (each contentStringAt: 'ExportingStackId')
				value: (each contentStringAt: 'Value') ]) asArray
]
