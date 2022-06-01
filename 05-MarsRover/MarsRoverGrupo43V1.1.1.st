!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 10:25:32'!
test01

	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.
	
	self assert: unRover posicion = (0@0).
	self assert: unRover apuntando = 'N'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 10:25:32'!
test02

	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.
	
	unRover recibirComando: 'f'.
		
	self deny: unRover posicion = (0@0).
	self assert: unRover apuntando = 'N'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 10:25:32'!
test03

	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.
	
	unRover recibirComando: 'b'.
		
	self deny: unRover posicion = (0@0).
	self assert: unRover apuntando = 'N'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 10:41:58'!
test04

	"
	Rotar 90 grados a la izquierda
	Rotar deberia cambiar la direccion del apuntador.
	"

	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.
	
	unRover recibirComandoDeRotacion: 'l'.

	self assert: unRover apuntando = 'O'.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 11:08:01'!
test05

	"
	Intento que falle:

	Rotar 90 grados a la izquierda
	Rotar deberia cambiar la direccion del apuntador.
	"

	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.
	
	unRover recibirComandoDeRotacion: 'l'.
	self deny: unRover apuntando = 'E'.
	! !


!classDefinition: #Comando category: 'MarsRover'!
Object subclass: #Comando
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Comando methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 10:54:04'!
ejecutarComandoDeRotacion: unPunto desde: puntoInicial 
	self subclassResponsibility.! !

!Comando methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 10:39:23'!
ejecutarComandoEn: unaPosicion
	self subclassResponsibility.! !

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


!classDefinition: #ComandoRotarHaciaLaIzquierda category: 'MarsRover'!
Comando subclass: #ComandoRotarHaciaLaIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!ComandoRotarHaciaLaIzquierda methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 10:58:15'!
ejecutarComandoDeRotacion: unPunto desde: puntoInicial
	
	(puntoInicial = 'N') ifTrue: [
		^ 'O'.
	].
	(puntoInicial = 'E') ifTrue: [
		^ 'N'.
	].
	(puntoInicial = 'O') ifTrue: [
		^ 'S'.
	].
	(puntoInicial = 'S') ifTrue: [
		^ 'E'.
	].! !

!ComandoRotarHaciaLaIzquierda methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 10:39:43'!
ejecutarComandoEn: unaPosicion
	^ (0@0).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRotarHaciaLaIzquierda class' category: 'MarsRover'!
ComandoRotarHaciaLaIzquierda class
	instanceVariableNames: ''!

!ComandoRotarHaciaLaIzquierda class methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 10:33:25'!
tipo

	^ 'l'! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccionCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'war 5/31/2022 23:17:51'!
apuntando

	^ direccionCardinal ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 10:24:30'!
initializeEnPosicion: unaPosicion apuntandoA: unaDireccionCardinal 

	posicion := unaPosicion.
	
	direccionCardinal := unaDireccionCardinal .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 10:24:36'!
posicion
	^ posicion.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 10:24:49'!
recibirComando: unComando

	| nuevoComando |
	
	nuevoComando := Comando definirComando: unComando .
	
	posicion := nuevoComando ejecutarComandoEn: posicion .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 11:09:35'!
recibirComandoDeRotacion: unComando

	| nuevoComando |
	
	nuevoComando := Comando definirComando: unComando.

	direccionCardinal := nuevoComando ejecutarComandoDeRotacion: unComando desde: direccionCardinal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'JG 6/1/2022 11:08:44'!
enPosicion: unaPosicion apuntandoA: unaDireccionCardinal

	^ self new initializeEnPosicion: unaPosicion apuntandoA: unaDireccionCardinal ! !
