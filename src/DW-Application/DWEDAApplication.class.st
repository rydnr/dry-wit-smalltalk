Class {
	#name : #DWEDAApplication,
	#superclass : #EDAApplication,
	#category : #'DW-Application'
}

{ #category : #'setup - commands' }
DWEDAApplication >> registerDeleteCommandBuilderIn: registry forCommandType: aSymbol [
	<commandBuilderFor: #LIST_EXPORTS>
	| builder |
	builder := DWCommandBuilder new.
	registry addBuilder: builder forCommand: aSymbol
]
