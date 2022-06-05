# Restaurante

Linkeding [@Stiven Morelos Barahona](https://www.linkedin.com/in/stiven-morelo-barahona-61a9a11a5/)

## Patron Bloc y Clean Architecture

Utilizando el patrón bloc para el planteamiento de la lógica de la aplicación, subdividiendo de responsabilidades y creando entidades abstractas que controlan las peticiones a través de consumo de servicios con inyectados por dependencias, mientras que clean architecture entre sus grandes bondades nos entrega una forma clara de organización de proyectos y refuerzos de principios SOLID, entre otros puntos, mejorando la legibilidad del proyecto mismo.

## Manejo de Estado

Para el control de la información y estados en la aplicación se emplea Cubit dado su gran manejo y adaptación a diferentes eventualidades, gracias a su emisión de estados, basados en el principio de los Streams, dado que el principio de responsabilidad única aplicado a este permite la accesibilidad estable y rápida en cualquier momento de la ejecución, sin crear otra entidad o romper el flujo de Stream.

## API

En el tema de las Apis, este proceso fue el que más tiempo me consumió en la prueba, incluso más que el desarrollo, dado que se debe analizar diferentes opciones entre gratuitas y completas, por tanto, opte por usar a las APIS de google cloud para poder realizar un traqueo correcto y acertado de las ciudades y sus restaurantes.

## Inyeccion de dependencias

Las dependencias en este proyecto se manejan de la forma simple recomendada por el equipo desarrollador de Flutter, evitando usar librerías externas que proporcionen un nivel más alto de dificultad en legibilidad del código mismo y mantenibilidad del código mismo, aun siendo esto una prueba las buenas prácticas no deben dejarse de lado.


Nota: Realmente me falto un poco más de tiempo para entregar una prueba algo más completa de esto, pues consideró que solo entregue 3 de los 4 puntos a desarrollar, dado la poca información que encontré para uso de una API pública que devolviera información sobre las transacciones históricas, estaré atento a vuestro veredicto, muchas gracias por la oportunidad y la realización de los respectivos test a los 3 niveles actuales en flutter.
