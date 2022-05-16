!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'war 5/16/2022 00:03:47'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := UnlimitedStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'war 5/16/2022 00:03:53'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := UnlimitedStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'war 5/16/2022 00:03:57'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := UnlimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'war 5/16/2022 00:04:01'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := UnlimitedStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'war 5/16/2022 00:04:06'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := UnlimitedStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'war 5/16/2022 00:04:11'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := UnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'war 5/16/2022 00:04:18'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := UnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'war 5/16/2022 00:04:22'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := UnlimitedStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'war 5/16/2022 00:04:27'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := UnlimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'war 5/16/2022 00:04:32'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := UnlimitedStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'war 5/16/2022 00:16:41'!
test11StackWithALimitShouldBeEmptyWhenCreated

	| stack size |
	size := 2 .
	
	stack := LimitedStack new initializeWithMaxSize: size .
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'war 5/16/2022 00:26:32'!
test12CanNotAddElementsToAFullStack

	| stack size|
	
	size := 2.
	
	stack := LimitedStack new initializeWithMaxSize: size .
	stack push: 'something' .
	
	stack push: 'another one' .
	
	self should: [ stack push: 'third thing' ]	
		
		raise: Error
		
		withExceptionDo: [ :anError | self assert: OOStack fullStackErrorDescription equals: anError messageText ].! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack finder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'war 5/15/2022 23:16:42'!
test01EmptyPrefixReturnsError
	|aString|
	
	aString := ''.
	self assertingThatABlockFails: [ self findAString: aString ] andReturnsAnError: [ SentenceFinderByPrefix CanNotFindAnEmptyPrefixError ] .! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'war 5/15/2022 23:16:42'!
test02PrefixWithASingleSpaceCharacterReturnsError
	|aString|
	
	aString := ' '.
	
	self assertingThatABlockFails: [ self findAString: aString ] andReturnsAnError: [ SentenceFinderByPrefix CanNotIncludeSpaceCharacterError ].! !

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


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'war 5/16/2022 00:19:55'!
setUp

	stack := UnlimitedStack new.

	stack push: 'winter is coming' .

	stack push: 'winning is everything' .

	stack push: 'The winds of Winter' .

	stack push: 'Winter is here' .
	
	stack push: '13 de Febrero' .
	
	stack push: '¿Ganaron?' .
	
	stack push: ' bueno' .
	
	finder := SentenceFinderByPrefix new.! !


!SentenceFinderByPrefixTest methodsFor: 'implementation' stamp: 'war 5/15/2022 23:16:42'!
assertingThatABlockFails: aBlock andReturnsAnError: anErrorBlock

	self 
	  	should: aBlock	
		raise: Error
		withExceptionDo: [ :anError | self assert: anErrorBlock value equals: anError messageText ].! !

!SentenceFinderByPrefixTest methodsFor: 'implementation' stamp: 'JG 5/15/2022 19:54:24'!
findAString: aString
	^ finder find: aString in: stack.! !

!SentenceFinderByPrefixTest methodsFor: 'implementation' stamp: 'JG 5/15/2022 22:45:00'!
findAnExceptedValue: exceptedValue with: aPrefix.
	self assert: ((self findAString: aPrefix) at: 1) value = exceptedValue equals: true.	! !


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
	instanceVariableNames: 'collection maxSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'public' stamp: 'war 5/15/2022 23:54:26'!
isEmpty
	
	^ ( ( collection first ) class ) = EmptyNode .
! !

!OOStack methodsFor: 'public' stamp: 'war 5/16/2022 00:00:23'!
pop
	
	| lastElement |
			
	self errorEmptyStack .

	lastElement := collection removeLast.
	
	self checkIfEmpty .
	
	^ lastElement value .! !

!OOStack methodsFor: 'public' stamp: 'war 5/15/2022 23:43:17'!
push: anObject
	
	self subclassResponsibility .! !

!OOStack methodsFor: 'public' stamp: 'war 5/15/2022 23:59:56'!
size

	^ collection  size.! !

!OOStack methodsFor: 'public' stamp: 'war 5/16/2022 00:00:09'!
top

	self errorEmptyStack .
	
	^ ( collection at: collection size ) value.! !


!OOStack methodsFor: 'private' stamp: 'war 5/16/2022 00:00:53'!
checkIfEmpty

	( collection isEmpty ) ifTrue: [ self emptyStackState. ]! !

!OOStack methodsFor: 'private' stamp: 'war 5/16/2022 00:00:58'!
emptyStackState

	| emptyNode |
	
	emptyNode := EmptyNode new .
	
	collection add: emptyNode ! !

!OOStack methodsFor: 'private' stamp: 'war 5/16/2022 00:01:05'!
errorEmptyStack

	( self isEmpty ) ifTrue: [ self error: self class stackEmptyErrorDescription ]! !

!OOStack methodsFor: 'private' stamp: 'war 5/16/2022 00:01:15'!
firstClear

	( self isEmpty ) ifTrue: [ collection remove: collection first ].! !


!OOStack methodsFor: 'initialization' stamp: 'war 5/15/2022 23:48:25'!
initialize
	
	self subclassResponsibility .! !

!OOStack methodsFor: 'initialization' stamp: 'war 5/15/2022 23:48:59'!
initializeWithMaxSize: aSize
	
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'war 5/15/2022 23:25:52'!
fullStackErrorDescription

	^ 'Stack is Full'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #LimitedStack category: 'Stack-Exercise'!
OOStack subclass: #LimitedStack
	instanceVariableNames: 'size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!LimitedStack methodsFor: 'initialization' stamp: 'war 5/16/2022 00:06:12'!
initialize! !

!LimitedStack methodsFor: 'initialization' stamp: 'war 5/15/2022 23:49:07'!
initializeWithMaxSize: aSize
	
	collection := OrderedCollection new .
	
	maxSize := aSize .
	
	self emptyStackState .! !


!LimitedStack methodsFor: 'private' stamp: 'war 5/16/2022 00:12:52'!
checkIfFull

	( self isFull ) ifTrue: [ 
		
		^ self error: self class fullStackErrorDescription .
		 
		] ! !

!LimitedStack methodsFor: 'private' stamp: 'war 5/15/2022 23:42:08'!
isFull

	^ collection size = maxSize 
! !


!LimitedStack methodsFor: 'public' stamp: 'war 5/16/2022 00:13:15'!
push: anObject
	
	| newNode |
	
	self checkIfFull .
	
	newNode := ValueNode new initializeWith: anObject .
	
	self firstClear .
	
	collection add: newNode . ! !


!classDefinition: #UnlimitedStack category: 'Stack-Exercise'!
OOStack subclass: #UnlimitedStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!UnlimitedStack methodsFor: 'public' stamp: 'war 5/15/2022 23:43:25'!
push: anObject
	
	| newNode |
	
	newNode := ValueNode new initializeWith: anObject .
	
	self firstClear .
	
	collection add: newNode .! !


!UnlimitedStack methodsFor: 'initialization' stamp: 'war 5/15/2022 23:48:33'!
initialize
	
	collection := OrderedCollection new .
	
	self emptyStackState .! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'public' stamp: 'war 5/16/2022 00:21:35'!
find: aPrefix in: aStack
	| temporal_stack found_string temporal_pop |
	
	self checkIfPrefixIsEmpty: aPrefix.
	self checkIfPrefixIncludesSpaceCharacter: aPrefix.

	temporal_stack := UnlimitedStack new.
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

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'JG 5/14/2022 16:46:44'!
CanNotFindAnEmptyPrefixError
	^ 'No se puede buscar un prefijo vacio'.
	"	(aPrefix = '') ifTrue: [ ^ 'NoSePuedeBuscarPrefijoVacioError'. ]."! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'JG 5/15/2022 22:36:39'!
CanNotIncludeSpaceCharacterError
	^ 'No puede contener espacios vacios'.
	"(aPrefix includesSubString: ' ') ifTrue: [ ^ 'NoPuedeContenerEspaciosVaciosError'. ]."! !
