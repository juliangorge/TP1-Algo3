!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack finder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JG 5/15/2022 19:55:00'!
test01EmptyPrefixReturnsError
	|aString|
	
	aString := ''.
	self 
		should: [self findAString: aString]	
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix CanNotFindAnEmptyPrefixError equals: anError messageText ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JG 5/15/2022 19:55:15'!
test02PrefixWithASingleSpaceCharacterReturnsError
	|aString|
	
	aString := ' '.
	self 
		should: [self findAString: aString]	
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix CanNotBeASingleSpaceCharacterError equals: anError messageText ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JG 5/15/2022 19:55:35'!
test03SentenceFinderIsCaseSensitive
	| aString |

	aString := 'Coming'.
	self assert: [self findAString: aString] value isEmpty equals: true.	

	aString := 'Winter'.
	self assert: [self findAString: aString] value isEmpty equals: false.	
	
	aString := 'wint'.
	self assert: [self findAString: aString] value isEmpty equals: false.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JG 5/15/2022 19:55:41'!
test04PrefixNotFound
	| aString |

	aString := 'Prueba'.
	self assert: [self findAString: aString] value isEmpty equals: true.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JG 5/15/2022 20:22:45'!
test05AdmitsSpecialCharacters
	| aString |

	aString := '¿'.
	self encuentroUnicoValor: '¿Ganaron?' ingresando: aString.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'war 5/15/2022 19:27:05'!
test06WorksWithSingleCharacters! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JG 5/15/2022 20:23:05'!
test07AdmitsNumbers
	| aString |

	aString := '13'.
	self encuentroUnicoValor: '13 de Febrero' ingresando: aString.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'war 5/15/2022 19:27:57'!
test08PrefixStartsWithSpaceCharacter! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JG 5/15/2022 20:23:26'!
test09FindsWhatIsExpected
	| aString |

	aString := 'Winter'.
	self encuentroUnicoValor: 'Winter is here' ingresando: aString.! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'war 5/15/2022 19:32:06'!
setUp

	stack := OOStack new.

	stack push: 'winter is coming' .

	stack push: 'winning is everything' .

	stack push: 'The winds of Winter' .

	stack push: 'Winter is here' .
	
	stack push: '13 de Febrero' .
	
	stack push: '¿Ganaron?' .
	
	stack push: ' bueno' .
	
	finder := SentenceFinderByPrefix new.! !


!SentenceFinderByPrefixTest methodsFor: 'implementation' stamp: 'JG 5/15/2022 20:18:06'!
encuentroUnicoValor: exceptedValue ingresando: aPrefix.
	self assert: ((self findAString: aPrefix) at: 1) value = exceptedValue equals: true.	! !

!SentenceFinderByPrefixTest methodsFor: 'implementation' stamp: 'JG 5/15/2022 19:54:24'!
findAString: aString
	^ finder find: aString in: stack.! !


!classDefinition: #Node category: 'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'initialization' stamp: 'war 5/14/2022 15:11:46'!
initialize
	
	self subclassResponsibility .! !

!Node methodsFor: 'initialization' stamp: 'war 5/14/2022 15:16:05'!
initializeWith: anObject
	
	self subclassResponsibility .! !


!Node methodsFor: 'public' stamp: 'war 5/14/2022 15:17:56'!
value
	
	self subclassResponsibility .! !


!classDefinition: #EmptyNode category: 'Stack-Exercise'!
Node subclass: #EmptyNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyNode methodsFor: 'public' stamp: 'war 5/14/2022 15:18:23'!
value
	
	^ value ! !


!EmptyNode methodsFor: 'initialization' stamp: 'war 5/14/2022 15:13:22'!
initialize
	
	value := nil ! !

!EmptyNode methodsFor: 'initialization' stamp: 'war 5/14/2022 15:20:39'!
initializeWith: anObject
	
	! !


!classDefinition: #ValueNode category: 'Stack-Exercise'!
Node subclass: #ValueNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValueNode methodsFor: 'public' stamp: 'war 5/14/2022 14:59:10'!
value

	^value! !


!ValueNode methodsFor: 'initialization' stamp: 'war 5/14/2022 15:16:58'!
initialize! !

!ValueNode methodsFor: 'initialization' stamp: 'war 5/14/2022 14:58:57'!
initializeWith: anObject

	value := anObject .! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'collection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'public' stamp: 'JG 5/14/2022 16:56:46'!
get
	^ collection.! !

!OOStack methodsFor: 'public' stamp: 'JG 5/14/2022 16:37:55'!
isEmpty
	
	^ ( ( collection first ) class ) = EmptyNode .
! !

!OOStack methodsFor: 'public' stamp: 'war 5/13/2022 18:19:04'!
pop
	
	| lastElement |
			
	self errorEmptyStack .

	lastElement := collection removeLast.
	
	self checkIfEmpty .
	
	^ lastElement value .! !

!OOStack methodsFor: 'public' stamp: 'JG 5/14/2022 16:37:36'!
push: anObject
	
	| newNode |
	
	newNode := ValueNode new initializeWith: anObject .
	
	self firstClear .
	
	collection add: newNode .! !

!OOStack methodsFor: 'public' stamp: 'war 5/11/2022 23:19:30'!
size

	^ collection  size.! !

!OOStack methodsFor: 'public' stamp: 'war 5/13/2022 18:19:47'!
top

	self errorEmptyStack .
	
	^ ( collection at: collection size ) value.! !


!OOStack methodsFor: 'private' stamp: 'war 5/13/2022 17:50:51'!
checkIfEmpty

	( collection isEmpty ) ifTrue: [ self emptyStackState. ]! !

!OOStack methodsFor: 'private' stamp: 'JG 5/14/2022 16:37:55'!
emptyStackState

	| emptyNode |
	
	emptyNode := EmptyNode new .
	
	collection add: emptyNode ! !

!OOStack methodsFor: 'private' stamp: 'war 5/13/2022 18:19:23'!
errorEmptyStack

	( self isEmpty ) ifTrue: [ self error: self class stackEmptyErrorDescription ]! !

!OOStack methodsFor: 'private' stamp: 'war 5/14/2022 15:27:44'!
firstClear

	( self isEmpty ) ifTrue: [ collection remove: collection first ].! !


!OOStack methodsFor: 'initialization' stamp: 'war 5/13/2022 17:53:04'!
initialize
	
	collection := OrderedCollection new .
	
	self emptyStackState .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'public' stamp: 'JG 5/15/2022 22:28:46'!
find: aPrefix in: aStack
	| temporal_stack found_string temporal_pop |
	(aPrefix = '') ifTrue: [ ^ self error: self class CanNotFindAnEmptyPrefixError. ].
	(aPrefix includesSubString: ' ') ifTrue: [ ^ self error: self class CanNotBeASingleSpaceCharacterError. ] .
	
	temporal_stack := OOStack new.
	found_string := OrderedCollection new.
	[aStack isEmpty] whileFalse: [
		temporal_pop := aStack pop.
		temporal_stack push: temporal_pop.
			
		(temporal_pop beginsWith: aPrefix) ifTrue: [
			found_string add: temporal_pop.
		]
	].

	[temporal_stack isEmpty] whileFalse: [
		aStack push: temporal_stack pop.
	].
	
	^ found_string.
	
	"^ aStack get select: [
		:element | element value beginsWith: aPrefix 
	]."	
	"El stack al terminar la operación de búsqueda debe de mantener las mismas oraciones en idéntico orden.	"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'JG 5/14/2022 16:47:47'!
CanNotBeASingleSpaceCharacterError
	^ 'No puede contener espacios vacios'.
	"(aPrefix includesSubString: ' ') ifTrue: [ ^ 'NoPuedeContenerEspaciosVaciosError'. ]."! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'JG 5/14/2022 16:46:44'!
CanNotFindAnEmptyPrefixError
	^ 'No se puede buscar un prefijo vacio'.
	"	(aPrefix = '') ifTrue: [ ^ 'NoSePuedeBuscarPrefijoVacioError'. ]."! !
