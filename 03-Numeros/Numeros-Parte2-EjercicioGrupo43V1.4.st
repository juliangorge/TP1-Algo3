!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'JG 5/8/2022 19:24:11'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'JG 5/8/2022 19:46:07'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.

	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'JG 5/7/2022 23:25:23'!
* aMultiplier
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'JG 5/7/2022 23:25:27'!
+ anAdder
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'JG 5/7/2022 23:25:14'!
- aSubtrahend
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'JG 5/7/2022 23:25:31'!
/ aDivisor
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'JG 5/7/2022 23:25:37'!
negated
	^ self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'JG 5/7/2022 23:51:35'!
isNegative
	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'JG 5/7/2022 23:51:43'!
isOne
	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'JG 5/7/2022 23:51:49'!
isZero
	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'JG 5/7/2022 23:51:28'!
invalidNumberType
	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'JG 5/7/2022 23:59:49'!
canNotDivideByZeroErrorDescription
	^ 'No se puede Dividir por Cero'.! !

!Numero class methodsFor: 'error descriptions' stamp: 'JG 5/7/2022 23:59:52'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'.! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'JG 5/8/2022 00:56:27'!
* aMultiplier
	^ aMultiplier multiplyToAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JG 5/8/2022 00:54:58'!
+ anAdder
	^ anAdder addToAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JG 5/8/2022 00:55:47'!
- aSubtrahend
	^ aSubtrahend subtractToAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JG 5/8/2022 00:45:43'!
/ aDivisor
	^ aDivisor divideAnEntero: self.
	"aDivisor dividiUnEntero: self."! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JG 5/8/2022 20:53:43'!
fibonacci
	self subclassResponsibility.! !


!Entero methodsFor: 'comparing' stamp: 'JG 5/7/2022 23:37:21'!
= anObject
	^ (anObject isKindOf: self class) and: [ value = anObject integerValue ]	.! !

!Entero methodsFor: 'comparing' stamp: 'JG 5/7/2022 23:54:55'!
hash
	^ value hash.! !


!Entero methodsFor: 'initialization' stamp: 'JG 5/8/2022 20:41:58'!
initializeWith: aValue
	value := aValue.! !


!Entero methodsFor: 'accessing' stamp: 'JG 5/8/2022 20:06:15'!
integerValue
	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	self subclassResponsibility.! !


!Entero methodsFor: 'printing' stamp: 'JG 5/8/2022 20:39:37'!
printOn: aStream
	aStream print: self integerValue.! !


!Entero methodsFor: 'testing' stamp: 'JG 5/8/2022 20:09:35'!
isNegative
	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'JG 5/8/2022 19:18:17'!
isOne
	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'JG 5/8/2022 19:20:52'!
isZero
	self subclassResponsibility.! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'JG 5/7/2022 23:54:33'!
// aDivisor
	^ self class with: value // aDivisor integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:54:42'!
addToAFraccion: aFraccion
	^ (self  * aFraccion denominator + aFraccion numerator)  / aFraccion denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:54:58'!
addToAnEntero: anEnteroAugend
	^ self class with: value + anEnteroAugend integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:47:27'!
divideAFraccion: aDividend
	^(aDividend numerator ) / (aDividend denominator * self).! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:45:43'!
divideAnEntero: aDividend
	^ Fraccion with: aDividend over: self.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JG 5/7/2022 23:54:30'!
greatestCommonDivisorWith: anEntero
	^ self class with: (value gcd: anEntero integerValue).! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:56:37'!
multiplyToAFraccion: aFraccion
	^ (self * aFraccion numerator) / aFraccion denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:56:27'!
multiplyToAnEntero: anEntero
	^ self class with: value * anEntero integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:55:39'!
subtractToAFraccion: aMinuend
	| newNumerator newDenominator |	
	newNumerator :=  aMinuend numerator - ( self * aMinuend denominator ) .
	newDenominator  := aMinuend denominator .
	^ newNumerator / newDenominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:55:47'!
subtractToAnEntero: aMinuend
	^ self class with: aMinuend integerValue - value .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'JG 5/8/2022 20:35:37'!
with: aValue
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"

	(aValue < 0) ifTrue: [ ^ Negative new initializeWith: aValue. ].
	(aValue = 0) ifTrue: [ ^ Zero new initializeWith: aValue. ]. 
	(aValue = 1) ifTrue: [ ^ One new initializeWith: aValue. ].
	
	aValue isInteger ifFalse: [ self error: 'aValue debe ser anInteger' ].
	^ GreaterThanOne new initializeWith: aValue.! !


!Entero class methodsFor: 'error descriptions' stamp: 'JG 5/8/2022 20:54:07'!
negativeFibonacciErrorDescription
	^ 'Fibonacci no está definido aquí para Enteros Negativos'.! !


!classDefinition: #GreaterThanOne category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #GreaterThanOne
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!GreaterThanOne methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 20:51:03'!
fibonacci
	| one two |

	one := Entero with: 1.
	two := Entero with: 2.

	^ (self - one) fibonacci + (self - two) fibonacci		.! !

!GreaterThanOne methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:21:41'!
integerValue
	^ value.! !

!GreaterThanOne methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:19:32'!
isNegative
	^ false.! !

!GreaterThanOne methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:18:32'!
isOne
	^ false.! !

!GreaterThanOne methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:15:46'!
isZero
	^ false.! !


!classDefinition: #Negative category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negative
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negative methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 20:54:31'!
fibonacci
	self error: Entero negativeFibonacciErrorDescription.! !

!Negative methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:21:54'!
integerValue
	^ value.! !

!Negative methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:19:38'!
isNegative
	^ true.! !

!Negative methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:18:36'!
isOne
	^ false.! !

!Negative methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:17:24'!
isZero
	^ false.! !


!classDefinition: #One category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #One
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!One methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 20:50:38'!
fibonacci
	^ Entero with: 1.! !

!One methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:22:27'!
integerValue
	^ 1.! !

!One methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:19:41'!
isNegative
	^ false.! !

!One methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:18:41'!
isOne
	^ true.! !

!One methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:15:49'!
isZero
	^ false.! !


!classDefinition: #Zero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Zero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Zero methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 20:50:53'!
fibonacci
	^ Entero with: 1.! !

!Zero methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:22:10'!
integerValue
	^ 0.! !

!Zero methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:19:44'!
isNegative
	^ false.! !

!Zero methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:18:45'!
isOne
	^ false.! !

!Zero methodsFor: 'as yet unclassified' stamp: 'JG 5/8/2022 19:06:01'!
isZero
	^ true.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JG 5/8/2022 00:56:37'!
* aMultiplier
	^ aMultiplier multiplyToAFraccion:	 self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JG 5/8/2022 00:54:42'!
+ anAdder
	^ anAdder addToAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JG 5/8/2022 00:55:39'!
- aSubtrahend
	^ aSubtrahend subtractToAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JG 5/8/2022 00:47:27'!
/ aDivisor
	^ aDivisor divideAFraccion: self.	! !


!Fraccion methodsFor: 'comparing' stamp: 'JG 5/7/2022 23:37:10'!
= anObject
	^ (anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'JG 5/7/2022 23:56:16'!
hash
	^ (numerator hash / denominator hash) hash.! !


!Fraccion methodsFor: 'accessing' stamp: 'JG 5/7/2022 23:56:11'!
denominator
	^ denominator.! !

!Fraccion methodsFor: 'accessing' stamp: 'JG 5/7/2022 23:48:05'!
numerator
	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'JG 5/7/2022 23:56:23'!
initializeWith: aNumerator over: aDenominator
	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"

	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].

	numerator := aNumerator.
	denominator := aDenominator.! !


!Fraccion methodsFor: 'testing' stamp: 'JG 5/7/2022 23:56:27'!
isNegative
	^ numerator < 0.! !

!Fraccion methodsFor: 'testing' stamp: 'JG 5/7/2022 23:56:31'!
isOne
	^ false.! !

!Fraccion methodsFor: 'testing' stamp: 'JG 5/7/2022 23:56:29'!
isZero
	^ false.! !


!Fraccion methodsFor: 'printing' stamp: 'JG 5/7/2022 23:56:37'!
printOn: aStream
	aStream
		print: numerator;
		nextPut: $/;
		print: denominator.! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:54:42'!
addToAFraccion: aFraccion
	| newNumerator newDenominator |

	newNumerator := (self numerator * aFraccion denominator) + (self denominator * aFraccion numerator).

	newDenominator := self denominator * aFraccion denominator.

	^ newNumerator / newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:54:58'!
addToAnEntero: anEnteroAugend
	^ (anEnteroAugend * self denominator + self numerator)  / self denominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:47:27'!
divideAFraccion: aDivisor
	^ (aDivisor numerator * self denominator) / (aDivisor denominator * self numerator).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:45:43'!
divideAnEntero: aDividend
	^ (self denominator * aDividend ) / self numerator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:56:37'!
multiplyToAFraccion: aFraccion
	^ (self numerator * aFraccion numerator) / (self denominator * aFraccion denominator).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:56:27'!
multiplyToAnEntero: anEntero
	^ (self numerator * anEntero) / self denominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:55:39'!
subtractToAFraccion: aMinuend
	| newNumerator newDenominator |
	
	newNumerator := (denominator * aMinuend numerator) - (numerator * aMinuend denominator) .
	
	newDenominator := denominator * aMinuend denominator.
	
	^ newNumerator / newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'JG 5/8/2022 00:55:47'!
subtractToAnEntero: aMinuend
	| newNumerator newDenominator |

	newNumerator := (aMinuend * self denominator) - self numerator .
	
	newDenominator  := self denominator.
	
	^ newNumerator / newDenominator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'JG 5/8/2022 21:02:00'!
with: aDividend over: aDivisor
	| greatestCommonDivisor numerator denominator |
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].

	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	denominator isOne ifTrue: [ ^numerator ].
	^ self new initializeWith: numerator over: denominator.
	! !
