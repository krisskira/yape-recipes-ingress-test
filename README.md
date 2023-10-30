#  Yape - Recipes Ingress-Test

## Solución de arquitectura:
Fue implementado el patron de arquitectura Model View ViewModel, debido a la facilidad de la implementacion del UnitTesting y por la capacidad que brinda este patron para la escalabilidad y mantenibilidad del proyecto.

## Buenas prácticas: 
Al utilizar el patron MVVM y Repository se separaron varias capas de la aplicacion las cuales fueron:
+++ Views:
    Contienen todo lo relacionado con la maquetacion de la UI, esta solo invoca al viewmodel o al router para realizar acciones permitiendo concentrar la logica de la aplicacion en el view-model y la logica de navegacion en el router.

+++ Model:
    Informacion acerca del modelo de los datos a utilizar, ayudando a estandarizar a corde a la logica de negocio las diferentes entidades u objectos que la conformacn.
    
+++ ViewModel:
    Contiene la logica de la aplicacion y es el encargado de comunicarse con la capa de datos y ejecucion de funciones invocadas desde la vista.

+++ Services:
    Son Helpers que ayudan a cumplir con funcionalidades genericas de la aplicacion en este caso usamos dos uno para comunicaar la app con la fuente de datos(backend) y otro que nos ayuda a gestionar la navegacion entre las diferentes pantallas de la app (Router).


## Pruebas automatizadas

### Unit testing y UITesting

 - Lista de Recetas
 - Filtrado de recetas por nombre
 - Filtrado de recetas por ingredientes
 - Navegacion al detalle de la receta
 - Navegacion al mapa de donde es origiria la receta
 
## Novedades de la plataforma
- Uso de SwiftUI, Combine, MapKit, y iOS 17

<hr>

### By: Crhistian David Vergara Gomez
<i>[send me a email](mailto:krisskira@gmail.com) - [call me](tel:+573183919187) - [send me a message by whatsapp](https://wa.link/fre450)</i>
