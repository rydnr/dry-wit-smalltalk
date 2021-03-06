Class {
	#name : #DWAWSListExports,
	#superclass : #DWAWSAccountCommand,
	#category : #'DW-Domain-AWS-CloudFormation-Exports'
}

{ #category : #accessing }
DWAWSListExports class >> latestVersion [
	<doc: 'Updates the latest version of the command class'>
	^ 1
]

{ #category : #'instance creation' }
DWAWSListExports class >> withBuilder: aBuilder [
	<commandName: #LIST_EXPORTS>
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withAccountId;
		withRegion;
		build: self.
	result version: self latestVersion.
	^ result
]
