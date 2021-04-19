Class {
	#name : #DWEventSourcingEvent,
	#superclass : #EDAEventSourcingEvent,
	#category : #'DW-Domain-Base'
}

{ #category : #accessing }
DWEventSourcingEvent >> tenant [
	^ super tenant ifNil: [ DWAggregateRoot defaultTenant ]
]
