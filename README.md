# Manual de Usuario: Analizador Léxico con Flex
## Descripción General
Este programa utiliza Flex para analizar léxicamente un conjunto de tokens, operadores y estructuras de control dentro de código fuente. Identifica y categoriza constantes enteras, reales, cadenas, identificadores, operadores, comentarios y estructuras de control, mostrando los resultados directamente en la consola. También detecta y reporta errores léxicos.
Requisitos del Sistema

  -	Flex instalado en un sistema operativo compatible (Linux).
  -	Compilador GCC para compilar y ejecutar el programa generado por Flex.

## Instalación de Prerrequisitos:

### Linux (Debian/Ubuntu):

  1.	Abra la terminal.
  2.	Ejecute `sudo apt update` para actualizar los paquetes.
  3.	Instale Flex y GCC con `sudo apt install flex gcc`.

### Instalación y Ejecución del programa

  1.	Guarde los archivos adjuntos del código del programa.
  2.	En la terminal, navegue al directorio donde se encuentra el archivo y ejecute el siguiente comando para generar el código fuente en C (en caso de que no exista el archivo .c):

  `flex -o LAB01_Arteaga_Cardona_Dominguez_Pinerda.c LAB01_Arteaga_Cardona_Dominguez_Pinerda.l`

  3.	Compile el código generado con GCC: (en caso de que no esté compilado en su directorio):

  `gcc LAB01_Arteaga_Cardona_Dominguez_Pinerda.c -o LAB01_Arteaga_Cardona_Dominguez_Pinerda -lfl`

  4.	Ejecute el programa, debe añadir el archivo de entrada que se desea analizar como mostramos a continuación:
   `./LAB01_Arteaga_Cardona_Dominguez_Pinerda entrada.txt > salida.txt `

## Funcionalidades del Programa

El programa reconoce y procesa distintos tipos de tokens, maneja errores léxicos y almacena identificadores. Provee salida detallada de los elementos reconocidos durante el análisis.

## Estructura del Programa
El programa está estructurado en secciones que definen tokens, manejan comentarios y errores, y procesan identificadores. La lógica principal se encuentra en la función `main`, que prepara la ejecución y muestra los resultados.

## Salida del Programa

La ejecución del programa produce una salida en un archivo que indica la categoría y valor de cada token procesado, seguido de un resumen de los identificadores encontrados y el recuento de errores léxicos.
