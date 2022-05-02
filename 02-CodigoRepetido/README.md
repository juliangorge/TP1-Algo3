# Cuestionario

Abstracci�n de los test 01 y 02

Para esta abstracci�n primero consideramos la idea de crear un objeto �Clock� que se encargara de contabilizar el tiempo que ocupaba una tarea, registrando un tiempo inicial y final en base al tiempo del sistema
Y que despu�s realizara la diferencia para calcular el tiempo de ejecuci�n. Despu�s de esto nos topamos que solamente serv�a para las pruebas por ende decidimos cambiar la implementaci�n a un mensaje dentro de las pruebas que hiciera la comparaci�n.

Como representar en Smalltalk

En la realidad observamos como objetos a los entes particulares, las ideas o conceptos de estos entes y al entorno que los contiene
En Smalltalk podemos representar estos como una clase (para ideas o conceptos), instancias (para objetos particulares) y modelo (representando la realidad). 

Teoria de Naur
�Qu� relaci�n hay entre sacar c�digo repetido (creando abstracciones) y la teor�a del modelo/sistema (del paper de Naur)?

El Paper de Naur habla sobre tres �reas esenciales que un programador puede aprovechar al ser un creador de teor�a. 
# El poder explicar c�mo la soluci�n se relaciona con los problemas del mundo real y ayuda a resolver.
# Que puede explicar por qu� cada parte del programa es como es.
# que tiene la teor�a del programa puede responder constructivamente a cualquier demanda de modificaci�n del programa, para manejar los problemas del mundo en una manera distinta.

Este �ltimo punto podr�a ser vinculante con la idea de quitar c�digo repetido debido a que la necesidad futura de modificaci�n del programa necesita las mejores pr�cticas posibles de abstracci�n y reutilizaci�n de c�digo, haciendolo m�s legible y simplificado en sus responsabilidades y areas de dominio.