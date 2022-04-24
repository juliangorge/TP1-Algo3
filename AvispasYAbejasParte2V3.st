!classDefinition: #Habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AvispasYAbejasParte2'!
Habitat class
	instanceVariableNames: 'orugas firmasGeneticasDeAvispasSegunAlimento huevosDeAvispas polillas'!

!Habitat class methodsFor: 'publico' stamp: 'Julian 4/23/2022 17:41:04'!
hacerQueElHabitatTengaLosRecursosSuficientes
	orugas := 2.
	polillas := 1.! !

!Habitat class methodsFor: 'publico' stamp: 'Julian 4/23/2022 17:41:26'!
queElHabitatTengaDosOrugasMas
	orugas := orugas + 2.! !

!Habitat class methodsFor: 'publico' stamp: 'Julian 4/23/2022 17:41:40'!
queElHabitatTengaDosPolillasMas
	polillas := polillas + 2.! !

!Habitat class methodsFor: 'publico' stamp: 'Julian 4/23/2022 17:42:49'!
queElHabitatTengaUnaOrugaMas
	orugas := orugas + 1.! !

!Habitat class methodsFor: 'publico' stamp: 'Julian 4/23/2022 17:42:40'!
queElHabitatTengaUnaPolillaMas
	polillas := polillas + 1.! !

!Habitat class methodsFor: 'publico' stamp: 'war 4/24/2022 01:08:24'!
retrocederElHabitatAlInicioDeLosTiempos
	huevosDeAvispas := 0.
	orugas := 0.
	polillas := 0.
	
	firmasGeneticasDeAvispasSegunAlimento := Dictionary new.
	firmasGeneticasDeAvispasSegunAlimento at: 'orugas' put: 0.
	firmasGeneticasDeAvispasSegunAlimento at: 'polillas' put: 0.
	firmasGeneticasDeAvispasSegunAlimento at: 'huevosDeOtrasAvispas' put: 0.! !


!Habitat class methodsFor: 'geters' stamp: 'Julian 4/23/2022 17:38:56'!
cantidadDeHuevosAlimentadosPorOrugas
	^firmasGeneticasDeAvispasSegunAlimento at: 'orugas'.! !

!Habitat class methodsFor: 'geters' stamp: 'Julian 4/23/2022 17:39:09'!
cantidadDeHuevosAlimentadosPorPolillas
	^firmasGeneticasDeAvispasSegunAlimento at: 'polillas'.! !

!Habitat class methodsFor: 'geters' stamp: 'war 4/24/2022 01:02:44'!
cantidadDeHuevosRobados
	^firmasGeneticasDeAvispasSegunAlimento at: 'huevosDeOtrasAvispas'.! !

!Habitat class methodsFor: 'geters' stamp: 'Julian 4/23/2022 17:39:50'!
cantidadDeHuevosTotales
	^huevosDeAvispas.! !

!Habitat class methodsFor: 'geters' stamp: 'Julian 4/23/2022 17:40:27'!
cantidadDeOrugas
	^orugas.! !

!Habitat class methodsFor: 'geters' stamp: 'Julian 4/23/2022 17:40:40'!
cantidadDePolillas
	^polillas.! !


!Habitat class methodsFor: 'reproduccionDeAvispas' stamp: 'war 4/24/2022 17:49:38'!
sumarHuevoReduciendoOrugas

		huevosDeAvispas := huevosDeAvispas + 1.
		
		orugas := orugas - 1.
		
		firmasGeneticasDeAvispasSegunAlimento at: 'orugas' put: huevosDeAvispas.! !

!Habitat class methodsFor: 'reproduccionDeAvispas' stamp: 'war 4/24/2022 17:50:05'!
sumarHuevoReduciendoPolillas

		huevosDeAvispas := huevosDeAvispas + 1.
		
		polillas := polillas - 1.
		
		firmasGeneticasDeAvispasSegunAlimento at: 'polillas' put: huevosDeAvispas.! !

!Habitat class methodsFor: 'reproduccionDeAvispas' stamp: 'war 4/24/2022 01:17:26'!
sumarHuevoRobandoHuevosDeAvispas
"Para implementacion de tell dont ask eliminar el if"
	(firmasGeneticasDeAvispasSegunAlimento at: 'orugas') > 0 ifTrue: [
		firmasGeneticasDeAvispasSegunAlimento at: 'orugas' put: (firmasGeneticasDeAvispasSegunAlimento at: 'orugas') - 1.
		firmasGeneticasDeAvispasSegunAlimento at: 'huevosDeOtrasAvispas' put: (firmasGeneticasDeAvispasSegunAlimento at: 'huevosDeOtrasAvispas') + 1.
	].

	(firmasGeneticasDeAvispasSegunAlimento at: 'polillas') > 0 ifTrue: [
		firmasGeneticasDeAvispasSegunAlimento at: 'polillas' put: (firmasGeneticasDeAvispasSegunAlimento at: 'polillas') - 1.
		firmasGeneticasDeAvispasSegunAlimento at: 'huevosDeOtrasAvispas' put: (firmasGeneticasDeAvispasSegunAlimento at: 'huevosDeOtrasAvispas') + 1.
	].! !

!Habitat class methodsFor: 'reproduccionDeAvispas' stamp: 'war 4/24/2022 18:10:18'!
sumarHuevoRobandoHuevosDeAvispas: tipoDeHuevoRobado

(tipoDeHuevoRobado = 'orugas') ifTrue:[
	
	firmasGeneticasDeAvispasSegunAlimento at: 'orugas' put: (firmasGeneticasDeAvispasSegunAlimento at: 'orugas') - 1.
		
	firmasGeneticasDeAvispasSegunAlimento at: 'huevosDeOtrasAvispas' put: (firmasGeneticasDeAvispasSegunAlimento at: 'huevosDeOtrasAvispas') + 1.
	
	]
ifFalse:[
	(tipoDeHuevoRobado = 'polillas')ifTrue:[
		
		firmasGeneticasDeAvispasSegunAlimento at: 'polillas' put: (firmasGeneticasDeAvispasSegunAlimento at: 'polillas') - 1.
		firmasGeneticasDeAvispasSegunAlimento at: 'huevosDeOtrasAvispas' put: (firmasGeneticasDeAvispasSegunAlimento at: 'huevosDeOtrasAvispas') + 1.
		
		]
	].! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'war 4/24/2022 18:11:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	orugas := 0.
	firmasGeneticasDeAvispasSegunAlimento := ((Dictionary new) add: ('huevosDeOtrasAvispas'->0); add: ('orugas'->0); add: ('polillas'->0); yourself).
	huevosDeAvispas := 0.
	polillas := 0.! !


!classDefinition: #Lara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Lara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Lara class' category: 'AvispasYAbejasParte2'!
Lara class
	instanceVariableNames: ''!

!Lara class methodsFor: 'Ciclo de Vida' stamp: 'Julian 4/23/2022 18:00:59'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^Habitat cantidadDeHuevosRobados.! !

!Lara class methodsFor: 'Ciclo de Vida' stamp: 'war 4/24/2022 17:59:27'!
intentarReproducirse
	"^Habitat sumarHuevoRobandoHuevosDeAvispas."
	(Habitat cantidadDeHuevosAlimentadosPorOrugas >= 1)ifTrue: [ self reproducirse:'orugas']
	ifFalse: [(Habitat cantidadDeHuevosAlimentadosPorPolillas >= 1)ifTrue: [ self reproducirse:'polillas']].! !

!Lara class methodsFor: 'Ciclo de Vida' stamp: 'war 4/24/2022 17:48:37'!
reproducirse
	^Habitat sumarHuevoRobandoHuevosDeAvispas.! !

!Lara class methodsFor: 'Ciclo de Vida' stamp: 'war 4/24/2022 18:10:51'!
reproducirse: tipoDeHuevoRobadoSegunAlimento

	^Habitat sumarHuevoRobandoHuevosDeAvispas:tipoDeHuevoRobadoSegunAlimento.! !


!classDefinition: #Oriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Oriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oriana class' category: 'AvispasYAbejasParte2'!
Oriana class
	instanceVariableNames: ''!

!Oriana class methodsFor: 'Ciclo de Vida' stamp: 'Julian 4/23/2022 18:01:10'!
cantidadDeHuevosConLaFirmaGeneticaDeAvispasNormales
	^Habitat cantidadDeHuevosAlimentadosPorOrugas.! !

!Oriana class methodsFor: 'Ciclo de Vida' stamp: 'war 4/24/2022 17:45:03'!
intentarReproducirse
	"^Habitat sumarHuevoReduciendoOrugas."
	(Habitat cantidadDeOrugas >= 1)ifTrue: [ self reproducirse].! !

!Oriana class methodsFor: 'Ciclo de Vida' stamp: 'war 4/24/2022 17:45:10'!
reproducirse
	^Habitat sumarHuevoReduciendoOrugas.! !


!classDefinition: #Ornella category: 'AvispasYAbejasParte2'!
Oriana subclass: #Ornella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #Polly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Polly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Polly class' category: 'AvispasYAbejasParte2'!
Polly class
	instanceVariableNames: ''!

!Polly class methodsFor: 'Ciclo de Vida' stamp: 'Julian 4/23/2022 17:51:28'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^Habitat cantidadDeHuevosAlimentadosPorPolillas.! !

!Polly class methodsFor: 'Ciclo de Vida' stamp: 'war 4/24/2022 17:45:39'!
intentarReproducirse
	"^Habitat sumarHuevoReduciendoPolillas."
	(Habitat cantidadDePolillas >= 1)ifTrue: [ self reproducirse].! !

!Polly class methodsFor: 'Ciclo de Vida' stamp: 'war 4/24/2022 17:45:46'!
reproducirse
	^Habitat sumarHuevoReduciendoPolillas.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Julian 4/23/2022 17:39:50'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosTotales isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Julian 4/23/2022 17:39:50'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosTotales isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Julian 4/23/2022 17:39:50'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosTotales isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Julian 4/23/2022 17:39:50'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosTotales isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'Julian 4/23/2022 17:39:50'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosTotales isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'Julian 4/23/2022 17:39:50'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosTotales isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'Julian 4/23/2022 17:39:50'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosTotales isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'Julian 4/23/2022 17:58:14'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'Julian 4/23/2022 17:59:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'Julian 4/23/2022 17:39:50'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosTotales isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'Julian 4/23/2022 18:00:02'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:31:24'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^Lara cantidadDeHuevosConLaFirmaGeneticaDeLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:32:21'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^Oriana cantidadDeHuevosConLaFirmaGeneticaDeAvispasNormales.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:32:45'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^Ornella cantidadDeHuevosConLaFirmaGeneticaDeAvispasNormales.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:33:07'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^Polly cantidadDeHuevosConLaFirmaGeneticaDePolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:33:14'!
habitat
	^Habitat.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:33:26'!
hacerQueElHabitatTengaLosRecursosSuficientes
	^Habitat hacerQueElHabitatTengaLosRecursosSuficientes.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:33:37'!
laAvispaLara
	^Lara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:33:47'!
laAvispaOriana
	^Oriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:34:00'!
laAvispaOrnella
	^Ornella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:34:08'!
laAvispaPolly
	^Polly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:34:31'!
queElHabitatTengaDosOrugasMas
	^Habitat queElHabitatTengaDosOrugasMas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:59:26'!
queElHabitatTengaDosPolillasMas
	^Habitat queElHabitatTengaDosPolillasMas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:35:37'!
queElHabitatTengaUnaOrugaMas
	^Habitat queElHabitatTengaUnaOrugaMas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:35:46'!
queElHabitatTengaUnaPolillaMas
	^Habitat queElHabitatTengaUnaPolillaMas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Julian 4/23/2022 17:35:53'!
retrocederElHabitatAlInicioDeLosTiempos
	^Habitat retrocederElHabitatAlInicioDeLosTiempos.! !

Habitat initializeAfterFileIn!