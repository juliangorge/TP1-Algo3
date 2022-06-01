!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:13:56'!
test01

	| unRover |
	
	unRover := MarsRover enPocision: (0@0) apundandoA: 'N'.
	
	self assert: unRover posicion = (0@0).
	self assert: unRover apuntando = 'N'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:26:16'!
test02

	| unRover |
	
	unRover := MarsRover enPocision: (0@0) apundandoA: 'N'.
	
	unRover recivirComando: 'f'.
		
	self deny: unRover posicion = (0@0).
	self assert: unRover apuntando = 'N'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:30:42'!
test03

	| unRover |
	
	unRover := MarsRover enPocision: (0@0) apundandoA: 'N'.
	
	unRover recivirComando: 'b'.
		
	self deny: unRover posicion = (0@0).
	self assert: unRover apuntando = 'N'.
	! !


!classDefinition: #Comando category: 'MarsRover'!
Object subclass: #Comando
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Comando class' category: 'MarsRover'!
Comando class
	instanceVariableNames: ''!

!Comando class methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:53:20'!
definirComando: unComando
	
	|claseValida|
			
	claseValida := self subclasses 
		detect: [ : unaSubclase | unaSubclase tipo = unComando ]  
		ifNone: [ self error: 'comando invalido' ].
		
		^ claseValida new.! !

!Comando class methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:24:12'!
tipo

	self subclassResponsibility ! !


!classDefinition: #ComandoAvanzar category: 'MarsRover'!
Comando subclass: #ComandoAvanzar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!ComandoAvanzar methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:25:23'!
ejecutarComandoEn: unaPosicion

	^ unaPosicion + (1@0).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoAvanzar class' category: 'MarsRover'!
ComandoAvanzar class
	instanceVariableNames: ''!

!ComandoAvanzar class methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:23:01'!
tipo

	^ 'f'! !


!classDefinition: #ComandoRetroceder category: 'MarsRover'!
Comando subclass: #ComandoRetroceder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!ComandoRetroceder methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:25:36'!
ejecutarComandoEn: unaPosicion

	^ unaPosicion - (1@0).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRetroceder class' category: 'MarsRover'!
ComandoRetroceder class
	instanceVariableNames: ''!

!ComandoRetroceder class methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:43:12'!
tipo

	^ 'b'! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccionCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:17:51'!
apuntando

	^ direccionCardinal ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:14:31'!
initializeEnPocision: unaPocision apuntandoA: unaDireccionCardinal 

	posicion := unaPocision.
	
	direccionCardinal := unaDireccionCardinal .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:09:40'!
posicion

	^ posicion! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:27:07'!
recivirComando: unComando

	| nuevoComando |
	
	nuevoComando := Comando definirComando: unComando .
	
	posicion := nuevoComando ejecutarComandoEn: posicion .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:17:18'!
enPocision: unaPocision apundandoA: unaDireccionCardinal

	^ self new initializeEnPocision: unaPocision apuntandoA: unaDireccionCardinal ! !
