Class {
	#name : #DWCommandBuilder,
	#superclass : #EDADefaultCommandBuilder,
	#category : #'DW-Application'
}

{ #category : #public }
DWCommandBuilder >> commandClassPrefix [
	"Returns the class prefix for application's commands"

	^ 'DW'
]
