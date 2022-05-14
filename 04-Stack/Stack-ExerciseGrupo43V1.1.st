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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #Node category: 'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 15:11:46'!
initialize
	
	self subclassResponsibility .! !

!Node methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 15:16:05'!
initializeWith: anObject
	
	self subclassResponsibility .! !

!Node methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 15:17:56'!
value
	
	self subclassResponsibility .! !


!classDefinition: #EmptyNode2 category: 'Stack-Exercise'!
Node subclass: #EmptyNode2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyNode2 methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 15:13:22'!
initialize
	
	value := nil ! !

!EmptyNode2 methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 15:20:39'!
initializeWith: anObject
	
	! !

!EmptyNode2 methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 15:18:23'!
value
	
	^ value ! !


!classDefinition: #ValueNode2 category: 'Stack-Exercise'!
Node subclass: #ValueNode2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValueNode2 methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 15:16:58'!
initialize! !

!ValueNode2 methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 14:58:57'!
initializeWith: anObject

	value := anObject .! !

!ValueNode2 methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 14:59:10'!
value

	^value! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'collection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'war 5/13/2022 17:50:51'!
checkIfEmpty

	( collection isEmpty ) ifTrue: [ self emptyStackState. ]! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 15:00:09'!
emptyStackState

	| emptyNode |
	
	emptyNode := EmptyNode2 new .
	
	collection add: emptyNode ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'war 5/13/2022 18:19:23'!
errorEmptyStack

	( self isEmpty ) ifTrue: [ self error: self class stackEmptyErrorDescription ]! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 15:27:44'!
firstClear

	( self isEmpty ) ifTrue: [ collection remove: collection first ].! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'war 5/13/2022 17:53:04'!
initialize
	
	collection := OrderedCollection new .
	
	self emptyStackState .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 15:00:47'!
isEmpty
	
	^ ( ( collection first ) class ) = EmptyNode2 .
! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'war 5/13/2022 18:19:04'!
pop
	
	| lastElement |
			
	self errorEmptyStack .

	lastElement := collection removeLast.
	
	self checkIfEmpty .
	
	^ lastElement value .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'war 5/14/2022 15:01:14'!
push: anObject
	
	| newNode |
	
	newNode := ValueNode2 new initializeWith: anObject .
	
	self firstClear .
	
	collection add: newNode .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'war 5/11/2022 23:19:30'!
size

	^ collection  size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'war 5/13/2022 18:19:47'!
top

	self errorEmptyStack .
	
	^ ( collection at: collection size ) value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !



!classDefinition: #EmptyNode category: 'Stack-Exercise'!
OOStack subclass: #EmptyNode
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyNode methodsFor: 'as yet unclassified' stamp: 'war 5/13/2022 17:26:48'!
initialize

	value := nil .! !


!classDefinition: #ValueNode category: 'Stack-Exercise'!
OOStack subclass: #ValueNode
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValueNode methodsFor: 'as yet unclassified' stamp: 'war 5/13/2022 17:43:35'!
initializeWith: anObject

	value := anObject .! !

!ValueNode methodsFor: 'as yet unclassified' stamp: 'war 5/13/2022 17:57:50'!
value

	^value! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
