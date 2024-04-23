# Java-Lexer USER GUIDE
Este programa emplea Flex para realizar un análisis léxico de tokens, operadores y estructuras de control en código fuente. Distingue y clasifica constantes enteras, reales, cadenas, identificadores, operadores, comentarios y estructuras de control, y muestra los resultados directamente en la consola. Además, identifica y reporta errores léxicos.

Requisitos:

  -	Flex  instalado en un sistema operativo compatible.
  -	Compilador GCC para compilar y ejecutar el programa generado por Flex.

## Adecuacion del Entorno (En terminal)

  1.	Ejecute `sudo apt update` para actualizar los paquetes.
  2.	Instale Flex y GCC con `sudo apt install flex gcc`.

### Compilación y Ejecución

  1.	Guarde los archivos adjuntos del código del programa.
  2.	En la terminal, navegue al directorio donde se encuentra el archivo:
       `cd ruta/al/directorio`
  4.  Ejecute el siguiente comando para generar el código fuente:

  `flex -o LAB01_Barrios_Rey_Gutierrez_Villarreal.c LAB01_LAB01_Barrios_Rey_Gutierrez_Villarreal.l` 
  
  4.	Compile el código generado con GCC: (en caso de que no esté compilado en su directorio):

  `gcc LAB01_Barrios_Rey_Gutierrez_Villarreal.c -o LAB01_LAB01_Barrios_Rey_Gutierrez_Villarreal -lfl`

  5.	Ejecute el programa, debe añadir el archivo de entrada que se desea analizar como mostramos a continuación:
   `./LAB01_LAB01_Barrios_Rey_Gutierrez_Villarreal entrada.txt > salida.txt `

## Casos de Uso

El programa es capaz de identificar y procesar diversos tipos de tokens, gestionar errores léxicos y registrar identificadores. Además, proporciona un informe detallado de los elementos detectados durante el análisis.

## Estructura del Programa

El programa se organiza en secciones dedicadas a la definición de tokens, el manejo de comentarios y errores, y el procesamiento de identificadores. La función principal 'main' configura la ejecución y presenta los resultados.

## Output

El programa genera un archivo de salida que muestra la categoría y el valor de cada token procesado, acompañado de un resumen de los identificadores detectados y un conteo de los errores léxicos encontrados.
