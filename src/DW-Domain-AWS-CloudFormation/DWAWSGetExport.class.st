Class {
	#name : #DWAWSGetExport,
	#superclass : #DWAWSAccountCommand,
	#category : #'DW-Domain-AWS-CloudFormation-Exports'
}

{ #category : #accessing }
DWAWSGetExport class >> latestVersion [
	<doc: 'Updates the latest version of the command class'>
	^ 1
]

{ #category : #'instance creation' }
DWAWSGetExport class >> withBuilder: aBuilder [
	<commandName: #GET_EXPORT>
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withAccountId;
		withRegion;
		build: self.
	result version: self latestVersion.
	^ result
]
