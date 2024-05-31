------------------------------------ Notas de la version, Agenda 1.0 ------------------------------------
Diseño interno:

-Se cargan los datos ingresados asginando memoria dinamicamente en el momento del "ALTA" asi como en la apertura
del archivo momento en el que se realiza una lectura inicial del archivo "DATOSAG.DAT".
-Se desrrollaron procesos de deteccion de errores contra la falla de apertura de archivos como asi
también la falta de memoria al generar un nuevo elemento de la lista.
-El programa se basa en una unica lista de elementos en la cual impacta directamente el ABM de datos,
a la vez de que se guarda todo en un archivo secuencial binario.
-Al momento no existen rutinas que validen la entrada de datos en todo el programa.
-Todavia no existen rutinas para generar el backup de informacion.

Interfaz de usuario:

-La interfaz se basa en "modo texto" y corre sobre una ventana de MS-DOS.
-La interfaz principal del programa se basa en cuatro menues:
 "ABM Datos", "Consulta", "Backup de informacion" y "Salir del programa" que a su vez en los casos de "ABM Datos" 
  y "Consulta" tienen submenues como se detalla a continuacion:
   1- ABM Datos
      1- Alta
      2- Baja
      3- Modificacion
      4- Volver al menu anterior

   2- Consulta
      1- Buscar por nombre
      2- Listar Todos
      3- Exportar
      4- Volver al menu anterior






 

