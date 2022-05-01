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

!CustomerBookTest methodsFor: 'testing' stamp: 'JG 5/1/2022 17:57:28'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |

	customerBook := CustomerBook new.

	self assert: ( self run: [ customerBook addCustomerNamed: 'John Lennon'. ] inLessThan: 50 ).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JG 5/1/2022 17:57:52'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |

	customerBook := CustomerBook new.

	paulMcCartney := 'Paul McCartney'.

	customerBook addCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.

	self assert: ( self run: [ customerBook addCustomerNamed: 'John Lennon'. ] inLessThan: 100 ).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JG 5/1/2022 17:48:16'!
test03CanNotAddACustomerWithEmptyName
	| customerBook |
	customerBook := CustomerBook new.
	
	self asserting: [ customerBook addCustomerNamed: ''. ] 
		when: Error happensWith: [
			self assert: 'Customer Name Cannot Be Empty' = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty
		].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JG 5/1/2022 17:48:55'!
test04CanNotRemoveAnInvalidCustomer

	| customerBook johnLennon |

	customerBook := CustomerBook new.

	johnLennon := 'John Lennon'.

	customerBook addCustomerNamed: johnLennon.

	self asserting: [ customerBook removeCustomerNamed: 'Paul McCartney'. ] 
		when: NotFound happensWith: [
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)
		].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JG 5/1/2022 17:49:56'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney |

	customerBook := CustomerBook new.

	paulMcCartney := 'Paul McCartney'.

	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.

	self check: customerBook numberOfCustomers: 1 active: 0 suspended: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JG 5/1/2022 17:41:13'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney |

	customerBook := CustomerBook new.

	paulMcCartney := 'Paul McCartney'.

	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.	

	self check: customerBook numberOfCustomers: 0 active: 0 suspended: 0.	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JG 5/1/2022 17:45:50'!
test07CanNotSuspendAnInvalidCustomer

	| customerBook johnLennon |

	customerBook := CustomerBook new.

	johnLennon := 'John Lennon'.

	customerBook addCustomerNamed: johnLennon.

	self asserting: [ customerBook suspendCustomerNamed: 'Ringo Starr'. ] 
		when: CantSuspend happensWith: [ 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)
		].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JG 5/1/2022 17:45:26'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	| customerBook johnLennon |

	customerBook := CustomerBook new.

	johnLennon := 'John Lennon'.

	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.

	self asserting: [ customerBook suspendCustomerNamed: johnLennon. ] 
		when: CantSuspend happensWith: [
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)
		].! !


!CustomerBookTest methodsFor: 'Implementacion' stamp: 'war 4/30/2022 23:23:08'!
asserting: aClosure when: anError happensWith: aBlock

[ aClosure value.
   self fail]
		on: anError
		do: aBlock! !

!CustomerBookTest methodsFor: 'Implementacion' stamp: 'JG 5/1/2022 17:43:04'!
check: customerBook numberOfCustomers: numberOfCustomers active: activeCustomers suspended: suspendedCustomers
	self assert: activeCustomers equals: customerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: numberOfCustomers equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'Implementacion' stamp: 'JG 5/1/2022 17:57:43'!
run: aBlock inLessThan: aCondition

| millisecondsBeforeRunning millisecondsAfterRunning |

millisecondsBeforeRunning := Time millisecondClockValue * millisecond.

aBlock.

millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
^ millisecondsAfterRunning - millisecondsBeforeRunning < (aCondition * millisecond).! !


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
