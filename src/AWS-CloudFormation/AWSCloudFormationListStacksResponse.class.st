Class {
	#name : #AWSCloudFormationListStacksResponse,
	#superclass : #AWSCloudFormationResponse,
	#category : #'AWS-CloudFormation'
}

{ #category : #accessing }
AWSCloudFormationListStacksResponse >> stackSummaries [
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
