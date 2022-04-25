El diseño de dominio fue implementado progresivamente a partir de las pruebas realizadas por la cátedra.
Paso a paso, las pruebas fueron corriendo hasta que terminaron funcionando todas.

Código:
Se tratan de un objeto que representa al Habitat que contiene como colaboradores a la cantidad de huevos de avispas, orugas, polillas y un diccionario de firmas genéticas.
Luego hay un objeto para las avispas Lara, Oriana, Ornella y Polly. 
El diccionario, fue incorporado con el fin de acostumbrarnos a la sintaxis del entorno y en base a lo que vimos en la clase del Jueves, aunque no creemos que fuese la única solución al diseño propuesto. Este indexaba según el alimento o si eran robados.
Al principio, se implementaron a Ornella y Oriana como objetos separados que respondían los mismos mensajes. Por lo tanto, concluímos que podríamos tratar a una como "objeto hijo" de la otra y evitar la repetición de código.
Definimos al Habitat como el responsable de validar la cantidad de recursos y cantidad de huevos. Creemos que es correcto ésto ya que debido a que, como una hipotética representación de la realidad, los insectos dejan sus huevos y luego no saben si seran todos nuevas avispas o robados por otra para ser alimento.