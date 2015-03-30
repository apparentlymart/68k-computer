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
LIBS:68kcomputer
LIBS:prototype-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L FLASHROM_512K_16 U?
U 1 1 551A444C
P 4650 2900
F 0 "U?" H 3900 3900 60  0000 C CNN
F 1 "FLASHROM_512K_16" H 4650 2900 60  0000 C CNN
F 2 "" H 4100 2900 60  0000 C CNN
F 3 "" H 4100 2900 60  0000 C CNN
	1    4650 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3650 5650 3650
Wire Wire Line
	5700 3650 5700 3750
Wire Wire Line
	5700 3750 5650 3750
Connection ~ 5700 3650
Wire Wire Line
	5650 3850 5700 3850
$Comp
L GND #PWR?
U 1 1 551A445A
P 5050 4300
F 0 "#PWR?" H 5050 4300 30  0001 C CNN
F 1 "GND" H 5050 4230 30  0001 C CNN
F 2 "" H 5050 4300 60  0000 C CNN
F 3 "" H 5050 4300 60  0000 C CNN
	1    5050 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4300 5050 4250
Wire Wire Line
	5000 4250 5100 4250
Wire Wire Line
	5000 4250 5000 4200
Wire Wire Line
	5100 4250 5100 4200
Connection ~ 5050 4250
$Comp
L VCC #PWR?
U 1 1 551A4465
P 4650 1700
F 0 "#PWR?" H 4650 1800 30  0001 C CNN
F 1 "VCC" H 4650 1800 30  0000 C CNN
F 2 "" H 4650 1700 60  0000 C CNN
F 3 "" H 4650 1700 60  0000 C CNN
	1    4650 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 1700 4650 1750
Wire Wire Line
	5650 2000 5700 2000
Wire Wire Line
	5650 2100 5700 2100
Wire Wire Line
	5650 2200 5700 2200
Wire Wire Line
	5650 2300 5700 2300
Wire Wire Line
	5650 2400 5700 2400
Wire Wire Line
	5650 2500 5700 2500
Wire Wire Line
	5650 2600 5700 2600
Wire Wire Line
	5650 2700 5700 2700
Wire Wire Line
	5650 2800 5700 2800
Wire Wire Line
	5650 2900 5700 2900
Wire Wire Line
	5650 3000 5700 3000
Wire Wire Line
	5650 3100 5700 3100
Wire Wire Line
	5650 3200 5700 3200
Wire Wire Line
	5650 3300 5700 3300
Wire Wire Line
	5650 3400 5700 3400
Wire Wire Line
	5650 3500 5700 3500
Wire Wire Line
	3600 2050 3650 2050
Wire Wire Line
	3600 2150 3650 2150
Wire Wire Line
	3600 2250 3650 2250
Wire Wire Line
	3600 2350 3650 2350
Wire Wire Line
	3600 2450 3650 2450
Wire Wire Line
	3600 2550 3650 2550
Wire Wire Line
	3600 2650 3650 2650
Wire Wire Line
	3600 2750 3650 2750
Wire Wire Line
	3600 2850 3650 2850
Wire Wire Line
	3600 2950 3650 2950
Wire Wire Line
	3600 3050 3650 3050
Wire Wire Line
	3600 3150 3650 3150
Wire Wire Line
	3600 3250 3650 3250
Wire Wire Line
	3600 3350 3650 3350
Wire Wire Line
	3600 3450 3650 3450
Wire Wire Line
	3600 3550 3650 3550
Wire Wire Line
	3600 3650 3650 3650
Wire Wire Line
	3600 3750 3650 3750
Wire Wire Line
	3600 3850 3650 3850
Text HLabel 3600 2050 0    60   Input ~ 0
WA0
Text HLabel 3600 2150 0    60   Input ~ 0
WA1
Text HLabel 3600 2250 0    60   Input ~ 0
WA2
Text HLabel 3600 2350 0    60   Input ~ 0
WA3
Text HLabel 3600 2450 0    60   Input ~ 0
WA4
Text HLabel 3600 2550 0    60   Input ~ 0
WA5
Text HLabel 3600 2650 0    60   Input ~ 0
WA6
Text HLabel 3600 2750 0    60   Input ~ 0
WA7
Text HLabel 3600 2850 0    60   Input ~ 0
WA8
Text HLabel 3600 2950 0    60   Input ~ 0
WA9
Text HLabel 3600 3050 0    60   Input ~ 0
WA10
Text HLabel 3600 3150 0    60   Input ~ 0
WA11
Text HLabel 3600 3250 0    60   Input ~ 0
WA12
Text HLabel 3600 3350 0    60   Input ~ 0
WA13
Text HLabel 3600 3450 0    60   Input ~ 0
WA14
Text HLabel 3600 3550 0    60   Input ~ 0
WA15
Text HLabel 3600 3650 0    60   Input ~ 0
WA16
Text HLabel 3600 3750 0    60   Input ~ 0
WA17
Text HLabel 3600 3850 0    60   Input ~ 0
WA18
Text HLabel 5700 2000 2    60   BiDi ~ 0
D0
Text HLabel 5700 2100 2    60   BiDi ~ 0
D1
Text HLabel 5700 2200 2    60   BiDi ~ 0
D2
Text HLabel 5700 2300 2    60   BiDi ~ 0
D3
Text HLabel 5700 2400 2    60   BiDi ~ 0
D4
Text HLabel 5700 2500 2    60   BiDi ~ 0
D5
Text HLabel 5700 2600 2    60   BiDi ~ 0
D6
Text HLabel 5700 2700 2    60   BiDi ~ 0
D7
Text HLabel 5700 2800 2    60   BiDi ~ 0
D8
Text HLabel 5700 2900 2    60   BiDi ~ 0
D9
Text HLabel 5700 3000 2    60   BiDi ~ 0
D10
Text HLabel 5700 3100 2    60   BiDi ~ 0
D11
Text HLabel 5700 3200 2    60   BiDi ~ 0
D12
Text HLabel 5700 3300 2    60   BiDi ~ 0
D13
Text HLabel 5700 3400 2    60   BiDi ~ 0
D14
Text HLabel 5700 3500 2    60   BiDi ~ 0
D15
Text HLabel 5750 3650 2    60   Input ~ 0
~CSROM
Text HLabel 5700 3850 2    60   Input ~ 0
R/~W
$EndSCHEMATC
