Class {
	#name : #DWAggregateRoot,
	#superclass : #EDAAggregateRoot,
	#category : #'DW-Domain-Base'
}

{ #category : #meta }
DWAggregateRoot class >> defaultTenant [
	^ 'default'
]

{ #category : #accessing }
DWAggregateRoot >> tenant [
	^ super tenant ifNil: [ self class defaultTenant ]
]
