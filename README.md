# Bia_flutter
##Requerimientos técnicos para construir el proyecto.**
* Flutter 3.10.6
* Android version mínimo: Android 5.0 - 21 LOLLIPOP - Api # 21
* IOS versión mínima 12


**➢ Arquitectura.**
* MVVM


**➢ Base de Datos.**
* FIREBAS -- Firestore DataBase --


**➢ Linter.**
* Pedantic

**➢ Dependencias y versiones.**

  cupertino_icons: ^1.0.2
  get: ^4.6.5
  http: ^0.13.3
  http_interceptor: ^1.0.2
  logger: ^2.0.1
  intl: ^0.18.1
  cached_network_image: ^3.2.3
  responsive_framework: ^0.2.0

**➢ Breve descripción de la responsabilidad de cada capa propuesta.**

* Se implementa el API de MArvel
  Para visualizar la lista de de los personajes de marvel se llama el api characyers de marvel con un limite de 100 personajes, para utilizar esta api es necesario registrarse y crear un hash para el uso publico de la api

➢ MVVM

• Modelo: Se encarga de obtener, almacenar y proveer los datos además de la lógica de negocios. • Vista: Muestra la información y reacciona ante la interacción del usuario. • ViewModel: El el medio que utiliza la vista para acceder a los datos, a la vez, se encarga de notificar la vista cuando los datos han cambiado.

➢ Recomendaciones

Principio de Responsabilidad Única consiste en que cada clase tendrá una única función o propósito con el propósito de mantener juntas las funcionalidades relacionadas lo que reduce el acoplamiento produciendo un código más flexible, mantenible y testeable.

Un buen código es aquel que se escribe teniendo en cuenta las siguientes consideraciones:

Llevar un control de versiones o Consultar la documentación en caso de dudas. o Se sigue la guía de estilo y nombramiento del lenguaje, framework y plataforma. o Se utilizan patrones de diseño. o Utilizar un Linter para mantener la calidad del código. o No abusar de las reducciones extremas en la sintáxis ya que reducen la legibilidad. o Seguir los principios SOLID o En el caso de Android se deben hacer pruebas en varios dispositivos con diferentes tamaños y densidades de pantalla, además de diversas marcas y versiones de OS. o Seguir buenas prácticas de programación. o En el caso de Android se deben hacer pruebas en varios dispositivos con diferentes tamaños y densidades de pantalla, además de diversas marcas y versiones de OS. o Seguir buenas prácticas de programación. o Documentar y agregar los comentarios para facilitar la lectura y compresión del código.

**➢ Screenshots.**

<p align="center">
  <img src="imagenes/splash.png" width="350" title="Splash">
  <img src="imagenes/home1.png" width="350" title="Home1">
  <img src="imagenes/home2.png" width="350" title="Home2">
  <img src="imagenes/home3.png" width="550" title="Home3">
  <img src="imagenes/detail.png" width="350" title="Detail4">
  
</p>

