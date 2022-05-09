# Cuestionario

Aporte de los mensajes de DD

Double dispatch es un patrón de diseño que permite tomar una decisión a partir de varios objetos en vez de uno solo. En un principio la decisión de qué método se va a ejecutar se hace a partir del objeto receptor del mensaje. Sin embargo, a veces con el objeto receptor no alcanza.
Debido a esto delegamos la responsabilidad al objeto desconocido que colabora externamente, realizando una segunda colaboración la cual llevara como colaborador externo el objeto receptor de la primera.

Lógica de instanciado

La Instanciación de un objeto debe de ser desde la subclase que haga referencia a un objeto concreto de la realidad 

Nombres de categorías de métodos

Dependiendo de la función del mensaje la categorización que usamos se divide en dos grupos Privados y Publicos. En la categoría de privados colocamos todos los mensajes cuya función son importantes para el propio objeto, es decir, funciones que el usuario u otros objetos no deben de conocer. En la categoría de Publicos si bien no usamos este nombre como tal si la dividimos en categorías que tienen que ver con una función en común de los mensajes al relacionarse con otros objetos.

Subclass Responsability

Un objeto abstracto es un objeto que existe para ser subclasificado en lugar de ser instanciado. Éste no suele definir todos sus métodos en sí, sino que hay algunos que no están definidos en sí mismo y son métodos abtractos.

Smalltalk no ha dedicado sintaxis para especificar que un metodo o una clase sean abstractos. Por convención, el cuarpo de un método abstracto consiste en una expresión "self subclassResponsibility". Esto es conocido como un "marker method" e indica que las subclases tienen la responsabilidad de definir una versión concreta del método. 
Los métodos "self subclassResponsibility" deberían siempre ser anulado, y por lo tanto nunca debe ser ejecutado. Sino se ejecutará una excepción.


No Rompas

El encapsulamiento es un mecanismo de protección de atributos y métodos, que protege a los datos asociados de un objeto contra su modificación por quien no tenga derecho a acceder a ellos, eliminando efectos secundarios e interacciones en cuanto al ocultamiento de los datos, como también futuros problemas en la extensión a futuro del programa e inestabilidad a la hora del mantenimiento del mismo.

--
La version que entregamos cumple lo pedido de lejercicio incluyendo algunos avances entorno al refactor propuesto para los puntos extra.

Alumnos:
Julián Gorge (104286) y William Ramirez (105706)