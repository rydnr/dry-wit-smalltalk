Class {
	#name : #DWSettings,
	#superclass : #Object,
	#category : #'DW-Settings'
}

{ #category : #'class initialization' }
DWSettings class >> doInitialize [
	"self duEnvironmentClass: EDADUEnvironment"
]

{ #category : #'class initialization' }
DWSettings class >> dwSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: DWEDAApplication settingsGroup)
		label: 'dry-wit';
		description: 'dry-wit settings';
		noOrdering
]

{ #category : #'class initialization' }
DWSettings class >> initialize [
	self doInitialize
]
