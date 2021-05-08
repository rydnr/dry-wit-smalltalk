Extension { #name : #AWSCloudFormationResponse }

{ #category : #'*DW-Domain-AWS-CloudFormation' }
AWSCloudFormationResponse >> asDictionary [
	| result |
	result := Dictionary new.
	self class allInstVarNames
		do: [ :varName | result add: varName -> (self instVarNamed: varName) ].
	^ result
]
