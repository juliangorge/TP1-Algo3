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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JG 5/15/2022 23:10:05'!
test01EmptyPrefixReturnsError
	|aString|
	
	aString := ''.
	self aBlockFails: [ self findAString: aString ] andReturnsAnError: [ SentenceFinderByPrefix CanNotFindAnEmptyPrefixError ] .! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JG 5/15/2022 23:09:52'!
test02PrefixWithASingleSpaceCharacterReturnsError
	|aString|
	
	aString := ' '.
	
	self aBlockFails: [ self findAString: aString ] andReturnsAnError: [ SentenceFinderByPrefix CanNotIncludeSpaceCharacterError ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JG 5/15/2022 23:09:56'!
test03PrefixNotFound
	| aString |

	aString := 'Prueba'.
	self assert: [self findAString: aString] value isEmpty equals: true.	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JG 5/15/2022 23:09:59'!
test04FoundWhatIsExpected
	| aString |

	aString := 'Winter'.
	self findAnExceptedValue: 'Winter is here' with: aString.! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'JG 5/15/2022 23:10:22'!
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


!SentenceFinderByPrefixTest methodsFor: 'implementation' stamp: 'JG 5/15/2022 19:54:24'!
findAString: aString
	^ finder find: aString in: stack.! !

!SentenceFinderByPrefixTest methodsFor: 'implementation' stamp: 'JG 5/15/2022 22:45:00'!
findAnExceptedValue: exceptedValue with: aPrefix.
	self assert: ((self findAString: aPrefix) at: 1) value = exceptedValue equals: true.	! !


!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'war 5/15/2022 23:03:56'!
aBlockFails: aBlock andReturnsAnError: anErrorBlock

	self 
	  	should: aBlock	
		raise: Error
		withExceptionDo: [ :anError | self assert: anErrorBlock value equals: anError messageText ].! !


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

!EmptyNode methodsFor: 'public' stamp: 'JG 5/15/2022 23:09:23'!
value
	^ nil.! !


!EmptyNode methodsFor: 'initialization' stamp: 'JG 5/15/2022 23:09:29'!
initialize
	
	value := nil.! !

!EmptyNode methodsFor: 'initialization' stamp: 'JG 5/15/2022 23:09:16'!
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

!SentenceFinderByPrefix methodsFor: 'public' stamp: 'JG 5/15/2022 22:41:47'!
find: aPrefix in: aStack
	| temporal_stack found_string temporal_pop |
	
	self checkIfPrefixIsEmpty: aPrefix.
	self checkIfPrefixIncludesSpaceCharacter: aPrefix.

	temporal_stack := OOStack new.
	found_string := OrderedCollection new.
	[aStack isEmpty] whileFalse: [
		temporal_pop := aStack pop.
		temporal_stack push: temporal_pop.

		(temporal_pop beginsWith: aPrefix) ifTrue: [
			found_string add: temporal_pop.
		].
	].

	[temporal_stack isEmpty] whileFalse: [
		aStack push: temporal_stack pop.
	].

	
	^ found_string.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'JG 5/15/2022 22:37:39'!
checkIfPrefixIncludesSpaceCharacter: aPrefix
	(aPrefix includesSubString: ' ') ifTrue: [ ^ self error: self class CanNotIncludeSpaceCharacterError. ] .! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'JG 5/15/2022 22:31:48'!
checkIfPrefixIsEmpty: aPrefix
	(aPrefix = '') ifTrue: [ ^ self error: self class CanNotFindAnEmptyPrefixError. ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'JG 5/14/2022 16:46:44'!
CanNotFindAnEmptyPrefixError
	^ 'No se puede buscar un prefijo vacio'.
	"	(aPrefix = '') ifTrue: [ ^ 'NoSePuedeBuscarPrefijoVacioError'. ]."! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'JG 5/15/2022 22:36:39'!
CanNotIncludeSpaceCharacterError
	^ 'No puede contener espacios vacios'.
	"(aPrefix includesSubString: ' ') ifTrue: [ ^ 'NoPuedeContenerEspaciosVaciosError'. ]."! !
