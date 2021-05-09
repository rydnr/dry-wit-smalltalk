Class {
	#name : #AWSCloudFormationListStacksResponse,
	#superclass : #AWSCloudFormationResponse,
	#instVars : [
		'stackSummaries'
	],
	#category : #'AWS-CloudFormation'
}

{ #category : #initialization }
AWSCloudFormationListStacksResponse >> initFromXmlElement: rootElement [
	super initFromXmlElement: rootElement.
	self stackSummaries: self parseStackSummaries
]

{ #category : #protected }
AWSCloudFormationListStacksResponse >> parseStackSummaries [
	^ (((self resultXml elementAt: 'StackSummaries') elementsAt: 'member')
		collect: [ :each | 
			AWSCloudFormationStackSummary new
				stackId: (each contentStringAt: 'StackId');
				stackStatus: (each contentStringAt: 'StackStatus');
				deletionTime: (each contentStringAt: 'DeletionTime');
				stackName: (each contentStringAt: 'StackName');
				creationTime: (each contentStringAt: 'CreationTime');
				templateDescription: (each contentStringAt: 'TemplateDescription');
				resourceTypes:
					(((each elementAt: 'ResourceTypes') elementsAt: 'member')
						collect: [ :member | member contentString ]) asArray;
				yourself ]) asArray
]

{ #category : #accessing }
AWSCloudFormationListStacksResponse >> stackSummaries [
	^ stackSummaries
]

{ #category : #accessing }
AWSCloudFormationListStacksResponse >> stackSummaries: aCollection [
	stackSummaries := aCollection
]
