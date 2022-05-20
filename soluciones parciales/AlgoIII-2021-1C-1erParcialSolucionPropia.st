!classDefinition: #ExtractorTest category: 'AlgoIII-2021-1C-1erParcial'!
TestCase subclass: #ExtractorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!ExtractorTest methodsFor: 'combustibles' stamp: 'war 5/18/2022 19:21:39'!
unaUnidadDeCarbon
	^ UnaMenaDeCarbon new.! !

!ExtractorTest methodsFor: 'combustibles' stamp: 'war 5/18/2022 19:21:49'!
unaUnidadDeGasoil
	^ UnLitroDeGasoil new! !

!ExtractorTest methodsFor: 'combustibles' stamp: 'war 5/18/2022 19:21:58'!
unaUnidadDeMadera
	^ UnTrozoDeMadera  new ! !


!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:39:03'!
costoDeExtraccionPorMena
	"Este código está repetido tambien en Extractor pero NO va a sumar puntos si lo quitan"
	^5 * joule
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/11/2021 23:58:00'!
test01UnExtractorSinCombustibleNoExtraeMenasNiLeSobraEnergia
	| extractor menasExtraidas |
	extractor := self extractorConMotorUniversalSinDesgaste.
	extractor alimentarEnergiaCon: #().
	
	menasExtraidas _ extractor extraer.
	
	self assert: menasExtraidas isEmpty.
	self assert: 0 * joule equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:35:49'!
test02UnExtractorConUnTrozoDeMaderaExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeMadera.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (13*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (13*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:37:39'!
test03UnExtractorConUnaMenaDeCarbonExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeCarbon.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (26*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (26*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:37:46'!
test04UnExtractorConUnLitroDeGasoilExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeGasoil.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (100*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.	
	self assert: (100*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:37:57'!
test05UnExtractorMasDeUnaUnidadDeCombustibleExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalSinDesgaste.
	combustible := OrderedCollection 	with: self unaUnidadDeMadera 	with: self unaUnidadDeMadera.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (2*13*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (2*13*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:39:27'!
test06UnExtractorConDiferentesTiposDeCombustibleExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalSinDesgaste.
	combustible := OrderedCollection 	 	
		with: self unaUnidadDeCarbon 
		with: self unaUnidadDeGasoil.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: ((26*joule) + (100*joule )) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: ((26*joule) + (100*joule )) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:39:36'!
test10UnExtractorDeCarbonPuedeUsarSuProductoComoCombustible
	| extractor menasDeCarbonExtraidas combustible |
	extractor := self extractorConMotorUniversalSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeMadera.
	extractor alimentarEnergiaCon: combustible.
	menasDeCarbonExtraidas _ extractor extraer.
	extractor alimentarEnergiaCon: (menasDeCarbonExtraidas first: 1).
	
	menasDeCarbonExtraidas _ extractor extraer.
	
	self assert: (29*joule) // self costoDeExtraccionPorMena equals: menasDeCarbonExtraidas size.
	self assert: (29*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !


!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'LL 6/12/2021 00:39:42'!
test07UnExtractorConMotorDeSolidosOptimizaElRendimientoDeLaMadera
	| extractor combustible menasExtraidas |
	extractor := self extractorConMotorDeSolidosSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeMadera.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (26*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (26*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'LL 6/12/2021 00:39:48'!
test08UnExtractorConMotorDeSolidosOptimizaElRendimientoDelCarbon
	| extractor combustible menasExtraidas |
	extractor := self extractorConMotorDeSolidosSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeCarbon.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (52*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (52*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'LL 6/12/2021 00:39:56'!
test09UnExtractorConMotorDeSolidosDegradaElRendimientoDelGasoil
	| extractor combustible menasExtraidas |
	extractor := self extractorConMotorDeSolidosSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeGasoil.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (25*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (25*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !


!ExtractorTest methodsFor: 'tests con motor con desgaste' stamp: 'LL 6/12/2021 00:40:18'!
test11UnExtractorConMotorUniversalDesgastadoTieneUnPeorRendimiento
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalConDesgaste: 0.5.
	combustible := OrderedCollection with: self unaUnidadDeGasoil.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: ((1 - 0.5)*100*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: ((1 - 0.5)*100*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor con desgaste' stamp: 'LL 6/12/2021 00:40:31'!
test12UnExtractorConMotorDeSolidosDesgastadoTieneUnPeorRendimiento
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorDeSolidosConDesgaste: 0.5.
	combustible := OrderedCollection with: self unaUnidadDeCarbon .
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: ((1 - 0.5)*52*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: ((1 - 0.5)*52*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !


!ExtractorTest methodsFor: 'extractores' stamp: 'war 5/20/2022 19:16:20'!
extractorConMotorDeSolidosConDesgaste: unNivelDeDesgaste
	
	| extractor |
	
	extractor := Extractor deCarbonConMotor: ( MotorDeSolidos conDesgaste: unNivelDeDesgaste ) .
	
	^extractor

! !

!ExtractorTest methodsFor: 'extractores' stamp: 'war 5/20/2022 19:16:55'!
extractorConMotorDeSolidosSinDesgaste
	
	| extractor |
	
	extractor := Extractor deCarbonConMotor:  ( MotorDeSolidos nuevo ).
	
	^extractor
! !

!ExtractorTest methodsFor: 'extractores' stamp: 'war 5/20/2022 19:17:25'!
extractorConMotorUniversalConDesgaste: unNivelDeDesgaste
	
	| extractor |
	
	extractor := Extractor deCarbonConMotor: ( MotorUniversal conDesgaste: unNivelDeDesgaste ) .
	
	^extractor

! !

!ExtractorTest methodsFor: 'extractores' stamp: 'war 5/20/2022 19:17:44'!
extractorConMotorUniversalSinDesgaste
	
	| extractor |
	
	extractor := Extractor deCarbonConMotor: ( MotorUniversal nuevo ).
	
	^extractor
! !


!classDefinition: #Combustible category: 'AlgoIII-2021-1C-1erParcial'!
Object subclass: #Combustible
	instanceVariableNames: 'cantidadDeEnergiaMotorUniversal cantidadDeEnergiaMotorDeSolidos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!Combustible methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 17:04:21'!
valorEnergeticoEnElMotor: unMotor

	self subclassResponsibility ! !


!classDefinition: #UnLitroDeGasoil category: 'AlgoIII-2021-1C-1erParcial'!
Combustible subclass: #UnLitroDeGasoil
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!UnLitroDeGasoil methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 16:55:03'!
valorEnergeticoEnElMotor: unMotor

	^ unMotor cantidadDeEnergiaDeUnLitroDeGasoil ! !


!classDefinition: #UnTrozoDeMadera category: 'AlgoIII-2021-1C-1erParcial'!
Combustible subclass: #UnTrozoDeMadera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!UnTrozoDeMadera methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 16:55:27'!
valorEnergeticoEnElMotor: unMotor

	^ unMotor cantidadDeEnergiaDeUnTrozoDeMadera ! !


!classDefinition: #UnaMenaDeCarbon category: 'AlgoIII-2021-1C-1erParcial'!
Combustible subclass: #UnaMenaDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!UnaMenaDeCarbon methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 16:55:42'!
valorEnergeticoEnElMotor: unMotor

	^ unMotor cantidadDeEnergiaDeUnaMenaDeCarbon ! !


!classDefinition: #Extractor category: 'AlgoIII-2021-1C-1erParcial'!
Object subclass: #Extractor
	instanceVariableNames: 'producto energiaActual motor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!Extractor methodsFor: 'combustible' stamp: 'JMB 5/28/2021 16:30:38'!
alimentarEnergiaCon: unidadesDeCombustibleACargar
	| energiaAAgregar |
	energiaAAgregar := motor transformarEnEnergia: unidadesDeCombustibleACargar.
	energiaActual := energiaActual + energiaAAgregar.! !


!Extractor methodsFor: 'extraccion' stamp: 'JMB 5/28/2021 16:21:09'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self consumirEnergia: energiaConsumida.
	^(self obtenerUnaCantidadDeMenas: cantidadDeMenas).! !


!Extractor methodsFor: 'initialization' stamp: 'war 5/20/2022 18:43:51'!
initializeWithMaterial: material conMotor: unMotor 
	self ponerEnCeroLaEnergia.	
	producto := material.
	
	motor := unMotor 
	
	! !


!Extractor methodsFor: 'accessing' stamp: 'SF 5/5/2021 20:50:00'!
energiaDisponible
	^energiaActual.! !


!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:35:27'!
consumirEnergia: energiaAConsumir
	energiaActual := energiaActual - energiaAConsumir.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:39:48'!
costoDeExtraccionPorMena
	^5 * joule.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:40:41'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:39:37'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!Extractor methodsFor: 'private' stamp: 'JMB 5/28/2021 16:21:08'!
obtenerUnaCantidadDeMenas: cantidadDeMenas
	^(Array new: cantidadDeMenas withAll: producto) asOrderedCollection.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:10:18'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Extractor class' category: 'AlgoIII-2021-1C-1erParcial'!
Extractor class
	instanceVariableNames: ''!

!Extractor class methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 19:13:45'!
deCarbonConMotor: unMotor
	^self new initializeWithMaterial: UnaMenaDeCarbon new conMotor: unMotor.! !


!classDefinition: #Motor category: 'AlgoIII-2021-1C-1erParcial'!
Object subclass: #Motor
	instanceVariableNames: 'nivelDeDesgaste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!Motor methodsFor: 'private' stamp: 'war 5/20/2022 17:07:18'!
transformarEnEnergiaUnaUnidad: unaUnidadDeCombustible
	
	| valorEnergeticoEnElMotor |

	valorEnergeticoEnElMotor := 	unaUnidadDeCombustible valorEnergeticoEnElMotor: self. 

	^ valorEnergeticoEnElMotor * (1 - nivelDeDesgaste) .! !


!Motor methodsFor: 'funcionamiento' stamp: 'war 5/20/2022 17:08:12'!
transformarEnEnergia: unidadesDeCombustible
	
	|total |
	
	total := 0 * joule.

	total := unidadesDeCombustible sum: [ : unCombustible | self transformarEnEnergiaUnaUnidad: unCombustible ] ifEmpty: 	0*joule .

	^ total! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Motor class' category: 'AlgoIII-2021-1C-1erParcial'!
Motor class
	instanceVariableNames: ''!

!Motor class methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 19:58:05'!
conDesgaste: unDesgaste

	self subclassResponsibility .! !

!Motor class methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 19:57:43'!
nuevo

	self subclassResponsibility .! !


!classDefinition: #MotorDeSolidos category: 'AlgoIII-2021-1C-1erParcial'!
Motor subclass: #MotorDeSolidos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!MotorDeSolidos methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 16:49:46'!
cantidadDeEnergiaDeUnLitroDeGasoil

	^25 * joule! !

!MotorDeSolidos methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 16:49:57'!
cantidadDeEnergiaDeUnTrozoDeMadera

	^26 * joule! !

!MotorDeSolidos methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 16:50:11'!
cantidadDeEnergiaDeUnaMenaDeCarbon

	^52 * joule! !

!MotorDeSolidos methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 19:07:13'!
initializeConDesgaste: unDesgaste

	nivelDeDesgaste := unDesgaste ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MotorDeSolidos class' category: 'AlgoIII-2021-1C-1erParcial'!
MotorDeSolidos class
	instanceVariableNames: ''!

!MotorDeSolidos class methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 19:12:23'!
conDesgaste: unDesgaste

	^ self new initializeConDesgaste: unDesgaste! !

!MotorDeSolidos class methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 19:06:29'!
nuevo

	^ self new initializeConDesgaste: 0! !


!classDefinition: #MotorUniversal category: 'AlgoIII-2021-1C-1erParcial'!
Motor subclass: #MotorUniversal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!MotorUniversal methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 16:47:40'!
cantidadDeEnergiaDeUnLitroDeGasoil

	^100 * joule! !

!MotorUniversal methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 16:48:19'!
cantidadDeEnergiaDeUnTrozoDeMadera

	^13 * joule! !

!MotorUniversal methodsFor: 'as yet unclassified' stamp: 'war 5/20/2022 16:48:48'!
cantidadDeEnergiaDeUnaMenaDeCarbon

	^26 * joule! !

!MotorUniversal methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 19:01:10'!
initializeConDesgaste: unDesgaste

	nivelDeDesgaste := unDesgaste ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MotorUniversal class' category: 'AlgoIII-2021-1C-1erParcial'!
MotorUniversal class
	instanceVariableNames: ''!

!MotorUniversal class methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 19:12:31'!
conDesgaste: unDesgaste

	^ self new initializeConDesgaste: unDesgaste! !

!MotorUniversal class methodsFor: 'as yet unclassified' stamp: 'war 5/18/2022 19:02:17'!
nuevo

	^ self new initializeConDesgaste: 0! !
