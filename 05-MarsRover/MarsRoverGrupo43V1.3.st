!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 16:29:06'!
test01RoverIniciaConUnaPosicionYApuntandoAUnPuntoCardinal
	self verificacionDeUnaPosicion: (0@0) yUnPuntoCardinal: 'N'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 16:29:16'!
test02RoverAvanzaEnLaDireccionQueApunta
	marsRover recibirCadenaDeComandos: 'f'.
	self verificacionDeUnaPosicion: (0@1) yUnPuntoCardinal: 'N'.	! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 16:29:27'!
test03RoverRetrocedeEnLaDireccionQueApunta
	marsRover recibirCadenaDeComandos: 'b'.
	self verificacionDeUnaPosicion: (0@-1) yUnPuntoCardinal: 'N'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 16:29:39'!
test04RoverRotaHaciaLaIzquierda
	marsRover recibirCadenaDeComandos: 'l'.
	self verificacionDeUnaPosicion: (0@0) yUnPuntoCardinal: 'O'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 16:29:48'!
test05RoverRotaHaciaLaDerecha
	marsRover recibirCadenaDeComandos: 'r'.
	self verificacionDeUnaPosicion: (0@0) yUnPuntoCardinal: 'E'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 16:29:56'!
test06RoverGiraYAvanza
	marsRover recibirCadenaDeComandos: 'lf'.
	self verificacionDeUnaPosicion: (-1@0) yUnPuntoCardinal: 'O'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 16:30:04'!
test07RoverEjecutaUnaCadenaDeCaracteres
	marsRover recibirCadenaDeComandos: 'frbl'.
	self verificacionDeUnaPosicion: (-1@1) yUnPuntoCardinal: 'N'.! !

!MarsRoverTest methodsFor: 'test' stamp: 'JG 6/2/2022 16:30:19'!
test08RoverDejaDeEjecutarComandosAlEncontrarUnComandoInvalido
	self should:  [
		marsRover recibirCadenaDeComandos: 'lfx'.
	]
	raise: Error
	withExceptionDo: [
		:unError | 
		self verificacionDeUnaPosicion: (-1@0) yUnPuntoCardinal: 'O'.
		self assert: unError messageText = Comando descripcionComandoNoValido.
	].! !


!MarsRoverTest methodsFor: 'verificacion' stamp: 'JG 6/2/2022 16:16:59'!
setUp
	marsRover := MarsRover enPosicion: 0@0 apuntandoA: 'N'.! !

!MarsRoverTest methodsFor: 'verificacion' stamp: 'JG 6/2/2022 16:28:28'!
verificacionDeUnaPosicion: unaPosicion yUnPuntoCardinal: unPuntoCardinal
	self assert: marsRover posicion = unaPosicion.
	self assert: marsRover apuntando = unPuntoCardinal.
	! !


!classDefinition: #Comando category: 'MarsRover'!
Object subclass: #Comando
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Comando methodsFor: 'public' stamp: 'JG 6/2/2022 16:50:19'!
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

!ComandoAvanzar methodsFor: 'public' stamp: 'JG 6/2/2022 16:24:48'!
ejecutarComandoEn: unaPosicion y: unaDireccionCardinal

	(unaDireccionCardinal = 'N') ifTrue: [
		^ unaPosicion + (0@1).
	].

	(unaDireccionCardinal = 'E') ifTrue: [
		^ unaPosicion + (1@0).
	].

	(unaDireccionCardinal = 'S') ifTrue: [
		^ unaPosicion + (0@-1).
	].

	(unaDireccionCardinal = 'O') ifTrue: [
		^ unaPosicion + (-1@0).
	].! !

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

!ComandoRetroceder methodsFor: 'public' stamp: 'JG 6/2/2022 16:25:10'!
ejecutarComandoEn: unaPosicion y: unaDireccionCardinal

	(unaDireccionCardinal = 'N') ifTrue: [
		^ unaPosicion + (0@-1).
	].

	(unaDireccionCardinal = 'E') ifTrue: [
		^ unaPosicion + (-1@0).
	].

	(unaDireccionCardinal = 'S') ifTrue: [
		^ unaPosicion + (0@1).
	].

	(unaDireccionCardinal = 'O') ifTrue: [
		^ unaPosicion + (1@0).
	].! !

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

!MarsRover methodsFor: 'public' stamp: 'JG 6/2/2022 16:30:40'!
apuntando
	^ direccionCardinal.! !

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
