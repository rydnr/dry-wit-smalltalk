Class {
	#name : #DWAWSListExportsClient,
	#superclass : #AWSCloudFormationService,
	#category : #'DW-Domain-AWS-CloudFormation-Exports'
}

{ #category : #'instance creation' }
DWAWSListExportsClient class >> withCredentials: anAWSCredentials andRegion: aRegion [
	^ self newWithCredentials: anAWSCredentials
			region: aRegion
]

{ #category : #accessing }
DWAWSListExportsClient >> request [
	^ self listExports
]
