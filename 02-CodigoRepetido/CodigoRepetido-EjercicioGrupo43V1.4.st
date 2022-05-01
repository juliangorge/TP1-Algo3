!classDefinition: #CantSuspend category: 'CodigoRepetido-EjercicioGrupo43V1.x'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-EjercicioGrupo43V1.x'!


!classDefinition: #NotFound category: 'CodigoRepetido-EjercicioGrupo43V1.x'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-EjercicioGrupo43V1.x'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-EjercicioGrupo43V1.x'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-EjercicioGrupo43V1.x'!

!CustomerBookTest methodsFor: 'testing' stamp: 'war 4/30/2022 23:35:26'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook clock |
	
	customerBook := CustomerBook new.
	
	clock := Clock new.
	
	customerBook addCustomerNamed: 'John Lennon'.
	clock endOfTask.
	
	self assert: (clock deltaLessThan:50).
	
	"otro camino para este test usando otro mensaje en lugar de objeto.
	
	self assert: ( self run: [ customerBook addCustomerNamed: 'John Lennon'. ] inLessThan: (50 * millisecond) )."
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'war 4/30/2022 23:35:35'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook clock paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	clock := Clock new.
	customerBook removeCustomerNamed: paulMcCartney.
	clock endOfTask .
	
	self assert: (clock deltaLessThan:100).
	
	"otro camino para este test usando otro mensaje en lugar de objeto.
	
	self assert: ( self run: [ customerBook addCustomerNamed: 'John Lennon'. ] inLessThan: (100 * millisecond) )."! !

!CustomerBookTest methodsFor: 'testing' stamp: 'war 4/30/2022 23:26:09'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
self asserting: [ customerBook addCustomerNamed: ''. ] when: Error happensWith: [self assert: 'Customer Name Cannot Be Empty' = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'war 4/30/2022 23:27:50'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
		self asserting: [ customerBook removeCustomerNamed: 'Paul McCartney'. ] when: NotFound happensWith: [ self assert: 																customerBook numberOfCustomers = 1.
											self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/3/2019 10:50:25'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/3/2019 10:50:28'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'war 4/30/2022 23:29:33'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
		self asserting: [ customerBook suspendCustomerNamed: 'Ringo Starr'. ] when: CantSuspend happensWith: [ self assert: 																customerBook numberOfCustomers = 1.
											self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'war 4/30/2022 23:31:15'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self asserting: [ customerBook suspendCustomerNamed: johnLennon. ] when: CantSuspend happensWith: [ self assert: 																customerBook numberOfCustomers = 1.
											self assert: (customerBook includesCustomerNamed: johnLennon) ].

! !


!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'war 4/30/2022 23:23:08'!
asserting: aClosure when: anError happensWith: aBlock

[ aClosure value.
   self fail]
		on: anError
		do: aBlock! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'war 4/30/2022 23:23:19'!
run: aBlock inLessThan: aCondition

| millisecondsBeforeRunning millisecondsAfterRunning|

millisecondsBeforeRunning := Time millisecondClockValue * millisecond.

aBlock.

millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
^millisecondsAfterRunning - millisecondsBeforeRunning < aCondition.! !


!classDefinition: #Clock category: 'CodigoRepetido-EjercicioGrupo43V1.x'!
Object subclass: #Clock
	instanceVariableNames: 'timeStart timeEnd'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-EjercicioGrupo43V1.x'!

!Clock methodsFor: 'as yet unclassified' stamp: 'WARP 4/29/2022 23:39:18'!
deltaLessThan: aTime
	^(timeEnd-timeStart) < (aTime * millisecond ).! !

!Clock methodsFor: 'as yet unclassified' stamp: 'WARP 4/29/2022 23:35:26'!
endOfTask
	timeEnd := self getTime.! !

!Clock methodsFor: 'as yet unclassified' stamp: 'WARP 4/29/2022 23:40:06'!
getTime
	^Time millisecondClockValue * millisecond.! !

!Clock methodsFor: 'as yet unclassified' stamp: 'WARP 4/29/2022 23:39:10'!
initialize
	timeStart := self getTime.
	timeEnd := 0 * millisecond .! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-EjercicioGrupo43V1.x'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active millisecondsBeforeRunning customerBook millisecondsAfterRunning'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-EjercicioGrupo43V1.x'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'war 4/30/2022 16:29:26'!
removeCustomerNamed: aName 

	((self findCustomerNamed: aName withCollection: 'active') = true) ifTrue:[^aName].
	
	((self findCustomerNamed: aName withCollection: 'suspended') = true) ifTrue:[^aName].
	
	^NotFound signal.! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'as yet unclassified' stamp: 'war 4/30/2022 16:26:12'!
findCustomerNamed: aName withCollection: aCollectionName
	|aCollection|	
	aCollection := OrderedCollection  new.
	
	(aCollectionName = 'active') ifTrue: [ aCollection := active ].
	(aCollectionName = 'suspended') ifTrue: [ aCollection := suspended ].
	
	1 to: aCollection size do: 
	[ :index |
		aName = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				^ true. 
			] 
	].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-EjercicioGrupo43V1.x'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
