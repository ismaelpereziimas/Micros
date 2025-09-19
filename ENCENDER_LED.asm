
LIST P=18F4550		;Directiva para definir el procesador
	#include <P18F4550.INC>	;Definicion de SFRs para el procesador

 

;******************************************************************************
;Bits de Configuracion 
;Microchip ha cambiado el formato para definir los bits de configuracion, por favor
;revisar el archivo P18F2455.INC para informacion adicional de la notacion
;Abajo hay algunos ejemplos

 

;********	Configuracion del Oscilador	**********

  CONFIG	FOSC = INTOSCIO_EC        ;Osc interno, RA6 como pin, USB usa Osc EC
	;CONFIG FOSC = HSPLL_HS      ;HS oscillator, PLL enabled (HSPLL)
	;CONFIG PLLDIV = 5			;Divide by 5 (20 MHz oscillator input)
	;CONFIG CPUDIV = OSC1_PLL2   ;[Primary Oscillator Src: /1][96 MHz PLL Src: /2]

;********	Otros bits de configuracion	**********

	CONFIG	PWRT = OFF					;PWRT deshabilitado
	CONFIG	BOR  = OFF					;Brown out reset deshabilitado 
	CONFIG	WDT	 = OFF					;Watchdog deshabilitado	
	CONFIG  MCLRE = on					;MCLR como entrada
	CONFIG	PBADEN = off					;Todos los pines como entradas analogicas deshabilitados
	CONFIG	LVP	= OFF					;Programacion en bajo voltaje apagado

;*********	Bits de proteccion	******************

	CONFIG	CP0	= OFF					;los bloques del codigo de programa
	CONFIG	CP1	= OFF					;no estan protegidos
	CONFIG	CP2	= OFF
	CONFIG	CPB	= OFF					;Sector Boot no esta protegido
	CONFIG	CPD	= OFF					;La EEPROM no esta protegida

;******************************************************************************

; Definicion de variables
; Estas variables son necesarias solo si las interrupciones de baja prioridad son usadas. 
; Mas variables podrian se necesarias para almacenar otros SFRs usados en las rutinas de 
; interrupcion.


		CBLOCK	0x080

		   		;variable usada para salvar contexto

				;variable usada para salvar contexto

		   		;variable usada para salvar contexto

		ENDC

 

		CBLOCK	0x000	;Variables en la ACCESS RAM (Banco 0) max 96 bytes

		

		ENDC

 

;******************************************************************************
;Datos de la EEPROM 
;Los Datos a ser programados en la  EEPROM son definidos aqui


		ORG	0xf00000


		DE	"Test Data",0,1,2,3,4,5

 

;******************************************************************************

; Vector de Reset.
; Este codigo comenzara a ejecutarse cuando suceda un reset

 
		ORG	0x0000

 

    goto	Main		;Se va al inicio del codigo principal

 

;******************************************************************************

; Vector de interrupcion de alta prioridad

; Este codigo comenzara a ejecutarse cuando una interrupcion de alta prioridad ocurra

; o cuando cualquier interrupcion ocurra si es que las prioridades de las interrupciones

; no estan habilitadas

 		ORG	0x0008

 

		bra	HighInt						;Va a la rutina de interrupcion de alta prioridad

 

;******************************************************************************

; Vector de interrupcion de baja prioridad y rutina

; Este codigo comenzara a ejecutrase cuando una interrupcion de baja prioridad ocurra

; Este codigo puede ser eliminado si las interrupciones de baja prioridad no son usadas


		ORG	0x0018

	   bra     LowInt

;	*** El codigo de la interrupcion de baja prioridad va aqui ***

LowInt:

;******************************************************************************

; Rutina de interrupcion de alta prioridad

; El codigo para la rutina de interrupcion de alta prioridad es colocado aqui para

; evitar conflictos con el vector de interrupciones de baja prioridad

 

HighInt

;	*** El codigo para las interrupciones de alta prioridad va aqui ***

 

;******************************************************************************

; Comienzo del programa principal

; El codigo del programa principal es colocado aqui

 





 

;	*** EL codigo principal va aqui ***

;One instruction cycle consists of four oscillator periods.

;Thus, for an oscillator frequency of 4 MHz, the normal

;instruction execution time is 1 �s.

;Para un Fosc de 48M cada ciclo de instruccion dura 4/48M => 83.3 ns

 

;*******************	Inicializamos perifericos	***************************

Main

    MOVLW B'00001111'
    MOVWF ADCON1

    MOVLW 00H
    MOVWF TRISB

    ;******************Configurar c�digo principal************

    

   LED
    MOVLW 01H
    MOVWF PORTB
    GOTO LED


	  

	  

	  END ; ES IMPORTANTE PONER END, YA QUE SIN ESTO NO COMPILA EL PROGRAMA
