EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_25X2 P?
U 1 1 551890A6
P 1550 2000
F 0 "P?" H 1550 3300 60  0000 C CNN
F 1 "CONN_25X2" V 1550 2000 50  0000 C CNN
F 2 "" H 1550 2000 60  0000 C CNN
F 3 "" H 1550 2000 60  0000 C CNN
	1    1550 2000
	1    0    0    -1  
$EndComp
$Comp
L CONN_25X2 P?
U 1 1 551890D2
P 3800 2000
F 0 "P?" H 3800 3300 60  0000 C CNN
F 1 "CONN_25X2" V 3800 2000 50  0000 C CNN
F 2 "" H 3800 2000 60  0000 C CNN
F 3 "" H 3800 2000 60  0000 C CNN
	1    3800 2000
	1    0    0    -1  
$EndComp
Text GLabel 2000 900  2    60   Output ~ 0
GND
Text GLabel 2000 800  2    60   Output ~ 0
GND
Text GLabel 1100 900  0    60   Output ~ 0
VCC
NoConn ~ 1150 800 
NoConn ~ 3400 800 
Wire Wire Line
	1950 800  2000 800 
Wire Wire Line
	1950 900  2000 900 
Wire Wire Line
	1100 900  1150 900 
Text GLabel 4250 800  2    60   Output ~ 0
GND
Text GLabel 4250 900  2    60   Output ~ 0
GND
Text GLabel 3350 900  0    60   Output ~ 0
VCC
Wire Wire Line
	3350 900  3400 900 
Wire Wire Line
	4200 800  4250 800 
Wire Wire Line
	4200 900  4250 900 
NoConn ~ 1150 3200
NoConn ~ 1150 3100
NoConn ~ 1150 3000
NoConn ~ 1950 3000
NoConn ~ 1950 3100
NoConn ~ 1950 3200
NoConn ~ 1150 1000
NoConn ~ 1950 1000
Text GLabel 1100 1100 0    60   Output ~ 0
GREEN0
Text GLabel 1100 1200 0    60   Output ~ 0
GREEN2
Text GLabel 2000 1100 2    60   Output ~ 0
GREEN1
Text GLabel 2000 1200 2    60   Output ~ 0
GREEN3
Wire Wire Line
	1100 1100 1150 1100
Wire Wire Line
	1100 1200 1150 1200
Wire Wire Line
	1950 1100 2000 1100
Wire Wire Line
	1950 1200 2000 1200
Text GLabel 2000 1300 2    60   Output ~ 0
BLUE1
Text GLabel 2000 1400 2    60   Output ~ 0
BLUE3
Text GLabel 1100 1300 0    60   Output ~ 0
BLUE0
Text GLabel 1100 1400 0    60   Output ~ 0
BLUE2
Text GLabel 3350 1000 0    60   Output ~ 0
HSYNC
Text GLabel 4250 1000 2    60   Output ~ 0
VSYNC
Text GLabel 3350 1100 0    60   Output ~ 0
RED0
Text GLabel 3350 1200 0    60   Output ~ 0
RED2
Text GLabel 4250 1100 2    60   Output ~ 0
RED1
Text GLabel 4250 1200 2    60   Output ~ 0
RED3
Text GLabel 1100 1500 0    60   Output ~ 0
~BERR
Wire Wire Line
	1100 1300 1150 1300
Wire Wire Line
	1100 1400 1150 1400
Wire Wire Line
	1100 1500 1150 1500
Wire Wire Line
	1950 1300 2000 1300
Wire Wire Line
	1950 1400 2000 1400
Wire Wire Line
	3350 1000 3400 1000
Wire Wire Line
	3350 1100 3400 1100
Wire Wire Line
	3350 1200 3400 1200
Wire Wire Line
	4200 1000 4250 1000
Wire Wire Line
	4200 1100 4250 1100
Wire Wire Line
	4200 1200 4250 1200
Text GLabel 2000 1500 2    60   Output ~ 0
IPL2
Text GLabel 2000 1600 2    60   Output ~ 0
IPL0
Text GLabel 1100 1600 0    60   Output ~ 0
IPL1
Wire Wire Line
	1950 1500 2000 1500
Wire Wire Line
	1950 1600 2000 1600
Wire Wire Line
	1100 1600 1150 1600
Text GLabel 1100 1800 0    60   Input ~ 0
FC0
Text GLabel 1100 1700 0    60   Input ~ 0
FC2
Text GLabel 2000 1700 2    60   Input ~ 0
FC1
Text GLabel 2000 1800 2    60   Input ~ 0
A1
Text GLabel 2000 1900 2    60   Input ~ 0
A3
Text GLabel 2000 2000 2    60   Input ~ 0
A5
Text GLabel 2000 2100 2    60   Input ~ 0
A7
Text GLabel 2000 2200 2    60   Input ~ 0
A9
Text GLabel 2000 2300 2    60   Input ~ 0
A11
Text GLabel 1100 1900 0    60   Input ~ 0
A2
Text GLabel 1100 2000 0    60   Input ~ 0
A4
Text GLabel 1100 2100 0    60   Input ~ 0
A6
Text GLabel 1100 2200 0    60   Input ~ 0
A8
Text GLabel 1100 2300 0    60   Input ~ 0
A10
Text GLabel 1100 2400 0    60   Input ~ 0
LA12
Text GLabel 1100 2500 0    60   Input ~ 0
LA14
Text GLabel 1100 2600 0    60   Input ~ 0
LA16
Text GLabel 1100 2700 0    60   Input ~ 0
LA18
Text GLabel 1100 2800 0    60   Input ~ 0
LA20
Text GLabel 1100 2900 0    60   Input ~ 0
LA22
Text GLabel 2000 2400 2    60   Input ~ 0
LA13
Text GLabel 2000 2500 2    60   Input ~ 0
LA15
Text GLabel 2000 2600 2    60   Input ~ 0
LA17
Text GLabel 2000 2700 2    60   Input ~ 0
LA19
Text GLabel 2000 2800 2    60   Input ~ 0
LA21
Text GLabel 2000 2900 2    60   Input ~ 0
LA23
Wire Wire Line
	1100 1700 1150 1700
Wire Wire Line
	1100 1800 1150 1800
Wire Wire Line
	1100 1900 1150 1900
Wire Wire Line
	1100 2000 1150 2000
Wire Wire Line
	1100 2100 1150 2100
Wire Wire Line
	1100 2200 1150 2200
Wire Wire Line
	1100 2300 1150 2300
Wire Wire Line
	1100 2400 1150 2400
Wire Wire Line
	1100 2500 1150 2500
Wire Wire Line
	1100 2600 1150 2600
Wire Wire Line
	1100 2700 1150 2700
Wire Wire Line
	1100 2800 1150 2800
Wire Wire Line
	1100 2900 1150 2900
Wire Wire Line
	1950 1700 2000 1700
Wire Wire Line
	1950 1800 2000 1800
Wire Wire Line
	1950 1900 2000 1900
Wire Wire Line
	1950 2000 2000 2000
Wire Wire Line
	1950 2100 2000 2100
Wire Wire Line
	1950 2200 2000 2200
Wire Wire Line
	1950 2300 2000 2300
Wire Wire Line
	1950 2400 2000 2400
Wire Wire Line
	1950 2500 2000 2500
Wire Wire Line
	1950 2600 2000 2600
Wire Wire Line
	1950 2700 2000 2700
Wire Wire Line
	1950 2800 2000 2800
Wire Wire Line
	1950 2900 2000 2900
Text GLabel 3350 1300 0    60   Output ~ 0
PA12
Text GLabel 3350 1400 0    60   Output ~ 0
PA14
Text GLabel 3350 1500 0    60   Output ~ 0
PA16
Text GLabel 3350 1600 0    60   Output ~ 0
PA18
Text GLabel 4250 1300 2    60   Output ~ 0
PA13
Text GLabel 4250 1400 2    60   Output ~ 0
PA15
Text GLabel 4250 1500 2    60   Output ~ 0
PA17
Text GLabel 4250 1600 2    60   Output ~ 0
~CSROM
Text GLabel 4250 1700 2    60   Output ~ 0
~CSRAM2
Text GLabel 3350 1700 0    60   Output ~ 0
~CSRAM1
Text GLabel 3350 1900 0    60   Input ~ 0
R/~W
Text GLabel 3350 1800 0    60   Output ~ 0
CLK
Text GLabel 4250 1800 2    60   Output ~ 0
DTACK
Text GLabel 4250 1900 2    60   Input ~ 0
~LDS
Text GLabel 3350 2000 0    60   Input ~ 0
~UDS
Text GLabel 4250 2000 2    60   Input ~ 0
~AS
Text GLabel 3350 2100 0    60   BiDi ~ 0
D0
Text GLabel 3350 2200 0    60   BiDi ~ 0
D2
Text GLabel 3350 2300 0    60   BiDi ~ 0
D4
Text GLabel 3350 2400 0    60   BiDi ~ 0
D6
Text GLabel 3350 2500 0    60   BiDi ~ 0
D8
Text GLabel 3350 2600 0    60   BiDi ~ 0
D10
Text GLabel 3350 2700 0    60   BiDi ~ 0
D12
Text GLabel 3350 2800 0    60   BiDi ~ 0
D14
Text GLabel 4250 2100 2    60   BiDi ~ 0
D1
Text GLabel 4250 2200 2    60   BiDi ~ 0
D3
Text GLabel 4250 2300 2    60   BiDi ~ 0
D5
Text GLabel 4250 2400 2    60   BiDi ~ 0
D7
Text GLabel 4250 2500 2    60   BiDi ~ 0
D9
Text GLabel 4250 2600 2    60   BiDi ~ 0
D11
Text GLabel 4250 2700 2    60   BiDi ~ 0
D13
Text GLabel 4250 2800 2    60   BiDi ~ 0
D15
Text GLabel 3350 2900 0    60   Output ~ 0
~BR
Text GLabel 4250 2900 2    60   Input ~ 0
~BG
Text GLabel 3350 3200 0    60   BiDi ~ 0
~RESET
Text Notes 2200 3500 0    60   ~ 0
Mojo Board Interface
Wire Notes Line
	600  600  4700 600 
Wire Notes Line
	4700 600  4700 3600
Wire Notes Line
	4700 3600 600  3600
Wire Notes Line
	600  3600 600  600 
$EndSCHEMATC
