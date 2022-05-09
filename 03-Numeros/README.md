# Cuestionario

Aporte de los mensajes de DD

Double dispatch es un patrón de diseño que permite tomar una decisión a partir de varios objetos en vez de uno solo. En un principio la decisión de qué método se va a ejecutar se hace a partir del objeto receptor del mensaje. Sin embargo, a veces con el objeto receptor no alcanza.
Debido a esto delegamos la responsabilidad al objeto desconocido que colabora externamente, realizando una segunda colaboración la cual llevara como colaborador externo el objeto receptor de la primera.

Lógica de instanciado

La Instanciación de un objeto debe de ser desde la subclase que haga referencia a un objeto concreto de la realidad 

Nombres de categorías de métodos

Dependiendo de la función del mensaje la categorización que usamos se divide en dos grupos Privados y Publicos. En la categoría de privados colocamos todos los mensajes cuya función son importantes para el propio objeto, es decir, funciones que el usuario u otros objetos no deben de conocer. En la categoría de Publicos si bien no usamos este nombre como tal si la dividimos en categorías que tienen que ver con una función en común de los mensajes al relacionarse con otros objetos.

Subclass Responsability



No Rompas

El hecho de romper encapsulamiento tiene que ver con darle a conocer a un objeto atributos de otro que no debería conocer esto lleva a un problema de extensión a futuro.
