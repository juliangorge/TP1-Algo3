!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 00:31:32'!
test01RoverIniciaConUnaPosicionYApuntandoAUnPuntoCardinal

	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.
	
	self assert: unRover posicion = (0@0).
	self assert: unRover apuntando = 'N'.
	! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 01:05:27'!
test02RoverAvanzaEnLaDireccionQueApunta

	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.
	
	unRover recibirCadenaDeComandos: 'f'.
		
	self assert: unRover posicion = (1@0).
	self assert: unRover apuntando = 'N'.
	! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 01:05:33'!
test03RoverRetrocedeEnLaDireccionQueApunta

	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.
	
	unRover recibirCadenaDeComandos: 'b'.
		
	self assert: unRover posicion = (-1@0).
	self assert: unRover apuntando = 'N'.
	! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 01:05:49'!
test04RoverRotaHaciaLaIzquierda
	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.
	
	unRover recibirCadenaDeComandos: 'l'.

	self assert: unRover apuntando = 'O'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 01:01:56'!
test05RoverRotaHaciaLaDerecha
	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.
	
	unRover recibirCadenaDeComandos: 'r'.

	self assert: unRover apuntando = 'E'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 01:19:36'!
test06RoverGiraYAvanza

	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.
	
	unRover recibirCadenaDeComandos: 'lf'.

	self assert: unRover apuntando = 'O'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 00:54:05'!
test07RoverEjecutaUnaCadenaDeCaracteres

	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.
	
	unRover recibirCadenaDeComandos: 'frbl'.

	self assert: unRover apuntando = 'N'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 01:23:46'!
test08RoverDejaDeEjecutarComandosAlEncontrarUnComandoInvalido

	| unRover |
	
	unRover := MarsRover enPosicion: (0@0) apuntandoA: 'N'.

	self should:  [
		unRover recibirCadenaDeComandos: 'lfx'.
	]
	raise: Error
	withExceptionDo: [
		:unError | 
		self assert: unError messageText = Comando descripcionComandoNoValido
	].! !


!classDefinition: #Comando category: 'MarsRover'!
Object subclass: #Comando
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Comando methodsFor: 'public' stamp: 'JG 6/2/2022 01:14:16'!
ejecutarComandoEn: unaPosicion y: unaDireccionCardinal
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Comando class' category: 'MarsRover'!
Comando class
	instanceVariableNames: ''!

!Comando class methodsFor: 'public' stamp: 'war 5/31/2022 23:24:12'!
tipo

	self subclassResponsibility ! !


!Comando class methodsFor: 'error descriptions' stamp: 'JG 6/2/2022 00:51:23'!
descripcionComandoNoValido
	^ 'Se ingresó un comando no válido'.! !


!Comando class methodsFor: 'initialization' stamp: 'JG 6/2/2022 00:59:54'!
definirComando: unComando
	
	|claseValida|
			
	claseValida := self subclasses 
		detect: [ : unaSubclase | unaSubclase tipo = unComando ]  
		ifNone: [ self error: self descripcionComandoNoValido ].
		
		^ claseValida new.! !


!classDefinition: #ComandoAvanzar category: 'MarsRover'!
Comando subclass: #ComandoAvanzar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!ComandoAvanzar methodsFor: 'public' stamp: 'JG 6/2/2022 01:14:44'!
ejecutarComandoEn: unaPosicion y: unaDireccionCardinal
	^ unaPosicion + (1@0).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoAvanzar class' category: 'MarsRover'!
ComandoAvanzar class
	instanceVariableNames: ''!

!ComandoAvanzar class methodsFor: 'public' stamp: 'JG 6/2/2022 00:57:33'!
tipo
	^ $f.! !


!classDefinition: #ComandoRetroceder category: 'MarsRover'!
Comando subclass: #ComandoRetroceder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!ComandoRetroceder methodsFor: 'public' stamp: 'JG 6/2/2022 01:14:54'!
ejecutarComandoEn: unaPosicion y: unaDireccionCardinal

	^ unaPosicion - (1@0).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRetroceder class' category: 'MarsRover'!
ComandoRetroceder class
	instanceVariableNames: ''!

!ComandoRetroceder class methodsFor: 'public' stamp: 'JG 6/2/2022 00:57:37'!
tipo
	^ $b.! !


!classDefinition: #ComandoRotarHaciaLaDerecha category: 'MarsRover'!
Comando subclass: #ComandoRotarHaciaLaDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!ComandoRotarHaciaLaDerecha methodsFor: 'public' stamp: 'JG 6/2/2022 01:18:11'!
ejecutarComandoEn: unPunto y: unaDireccionCardinal
	
	(unaDireccionCardinal = 'N') ifTrue: [
		^ 'E'.
	].
	(unaDireccionCardinal = 'E') ifTrue: [
		^ 'S'.
	].
	(unaDireccionCardinal = 'O') ifTrue: [
		^ 'N'.
	].
	(unaDireccionCardinal = 'S') ifTrue: [
		^ 'O'.
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRotarHaciaLaDerecha class' category: 'MarsRover'!
ComandoRotarHaciaLaDerecha class
	instanceVariableNames: ''!

!ComandoRotarHaciaLaDerecha class methodsFor: 'public' stamp: 'JG 6/2/2022 00:57:40'!
tipo
	^ $r.! !


!classDefinition: #ComandoRotarHaciaLaIzquierda category: 'MarsRover'!
Comando subclass: #ComandoRotarHaciaLaIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!ComandoRotarHaciaLaIzquierda methodsFor: 'public' stamp: 'JG 6/2/2022 01:17:55'!
ejecutarComandoEn: unPunto y: unaDireccionCardinal
	
	(unaDireccionCardinal = 'N') ifTrue: [
		^ 'O'.
	].
	(unaDireccionCardinal = 'E') ifTrue: [
		^ 'N'.
	].
	(unaDireccionCardinal = 'O') ifTrue: [
		^ 'S'.
	].
	(unaDireccionCardinal = 'S') ifTrue: [
		^ 'E'.
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRotarHaciaLaIzquierda class' category: 'MarsRover'!
ComandoRotarHaciaLaIzquierda class
	instanceVariableNames: ''!

!ComandoRotarHaciaLaIzquierda class methodsFor: 'public' stamp: 'JG 6/2/2022 00:57:47'!
tipo
	^ $l.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccionCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'public' stamp: 'war 5/31/2022 23:17:51'!
apuntando

	^ direccionCardinal ! !

!MarsRover methodsFor: 'public' stamp: 'JG 6/1/2022 10:24:36'!
posicion
	^ posicion.! !

!MarsRover methodsFor: 'public' stamp: 'JG 6/2/2022 00:38:41'!
recibirCadenaDeComandos: cadenaDeComando
	
	cadenaDeComando do: [ :unComando |
		self recibirComando: unComando 
	].! !


!MarsRover methodsFor: 'initialization' stamp: 'JG 6/1/2022 10:24:30'!
initializeEnPosicion: unaPosicion apuntandoA: unaDireccionCardinal 

	posicion := unaPosicion.
	
	direccionCardinal := unaDireccionCardinal .! !


!MarsRover methodsFor: 'private' stamp: 'JG 6/2/2022 01:09:38'!
recibirComando: unComando

	| nuevoComando confirmarComando |
	
	nuevoComando := Comando definirComando: unComando .
	
	confirmarComando := nuevoComando ejecutarComandoEn: posicion y: direccionCardinal.
	
	(posicion class = confirmarComando class) ifTrue: [
		posicion := confirmarComando.
	].

	(direccionCardinal class = confirmarComando class) ifTrue: [
		direccionCardinal := confirmarComando.
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'JG 6/1/2022 11:08:44'!
enPosicion: unaPosicion apuntandoA: unaDireccionCardinal

	^ self new initializeEnPosicion: unaPosicion apuntandoA: unaDireccionCardinal ! !
