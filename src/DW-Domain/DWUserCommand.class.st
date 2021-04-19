Class {
	#name : #DWUserCommand,
	#superclass : #EDAUserCommand,
	#category : #'DW-Domain-Base'
}

{ #category : #accessing }
DWUserCommand >> tenant [
	^ super tenant ifNil: [ DWAggregateRoot defaultTenant ]
]
