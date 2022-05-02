# Cuestionario

Abstracción de los test 01 y 02

Para esta abstracción primero consideramos la idea de crear un objeto “Clock” que se encargara de contabilizar el tiempo que ocupaba una tarea, registrando un tiempo inicial y final en base al tiempo del sistema
Y que después realizara la diferencia para calcular el tiempo de ejecución. Después de esto nos topamos que solamente servía para las pruebas por ende decidimos cambiar la implementación a un mensaje dentro de las pruebas que hiciera la comparación.

Como representar en Smalltalk

En la realidad observamos como objetos a los entes particulares, las ideas o conceptos de estos entes y al entorno que los contiene
En Smalltalk podemos representar estos como una clase (para ideas o conceptos), instancias (para objetos particulares) y modelo (representando la realidad). 

Teoria de Naur
¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

El Paper de Naur habla sobre tres áreas esenciales que un programador puede aprovechar al ser un creador de teoría. 
# El poder explicar cómo la solución se relaciona con los problemas del mundo real y ayuda a resolver.
# Que puede explicar por qué cada parte del programa es como es.
# que tiene la teoría del programa puede responder constructivamente a cualquier demanda de modificación del programa, para manejar los problemas del mundo en una manera distinta.

Este último punto podría ser vinculante con la idea de quitar código repetido debido a que la necesidad futura de modificación del programa necesita las mejores prácticas posibles de abstracción y reutilización de código, haciendolo más legible y simplificado en sus responsabilidades y areas de dominio.
En este ejercicio los costes de realizar la simplificacion del codigo no son contempladas pero en un ambiente laboral real esto puede resultar en un coste importante
