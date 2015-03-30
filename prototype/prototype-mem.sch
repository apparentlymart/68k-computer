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
L FLASHROM_512K_16 U2
U 1 1 551A444C
P 2200 2900
F 0 "U2" H 1450 3900 60  0000 C CNN
F 1 "FLASHROM_512K_16" H 2200 2900 60  0000 C CNN
F 2 "SSOP_Packages:TSSOP-48_6.1x12.5mm_Pitch0.5mm" H 1650 2900 60  0001 C CNN
F 3 "" H 1650 2900 60  0000 C CNN
	1    2200 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3850 3250 3850
$Comp
L GND #PWR021
U 1 1 551A445A
P 2600 4300
F 0 "#PWR021" H 2600 4300 30  0001 C CNN
F 1 "GND" H 2600 4230 30  0001 C CNN
F 2 "" H 2600 4300 60  0000 C CNN
F 3 "" H 2600 4300 60  0000 C CNN
	1    2600 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4300 2600 4250
Wire Wire Line
	2550 4250 2650 4250
Wire Wire Line
	2550 4250 2550 4200
Wire Wire Line
	2650 4250 2650 4200
Connection ~ 2600 4250
$Comp
L VCC #PWR022
U 1 1 551A4465
P 2200 1700
F 0 "#PWR022" H 2200 1800 30  0001 C CNN
F 1 "VCC" H 2200 1800 30  0000 C CNN
F 2 "" H 2200 1700 60  0000 C CNN
F 3 "" H 2200 1700 60  0000 C CNN
	1    2200 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1700 2200 1750
Wire Wire Line
	3200 2000 3250 2000
Wire Wire Line
	3200 2100 3250 2100
Wire Wire Line
	3200 2200 3250 2200
Wire Wire Line
	3200 2300 3250 2300
Wire Wire Line
	3200 2400 3250 2400
Wire Wire Line
	3200 2500 3250 2500
Wire Wire Line
	3200 2600 3250 2600
Wire Wire Line
	3200 2700 3250 2700
Wire Wire Line
	3200 2800 3250 2800
Wire Wire Line
	3200 2900 3250 2900
Wire Wire Line
	3200 3000 3250 3000
Wire Wire Line
	3200 3100 3250 3100
Wire Wire Line
	3200 3200 3250 3200
Wire Wire Line
	3200 3300 3250 3300
Wire Wire Line
	3200 3400 3250 3400
Wire Wire Line
	3200 3500 3250 3500
Wire Wire Line
	1150 2050 1200 2050
Wire Wire Line
	1150 2150 1200 2150
Wire Wire Line
	1150 2250 1200 2250
Wire Wire Line
	1150 2350 1200 2350
Wire Wire Line
	1150 2450 1200 2450
Wire Wire Line
	1150 2550 1200 2550
Wire Wire Line
	1150 2650 1200 2650
Wire Wire Line
	1150 2750 1200 2750
Wire Wire Line
	1150 2850 1200 2850
Wire Wire Line
	1150 2950 1200 2950
Wire Wire Line
	1150 3050 1200 3050
Wire Wire Line
	1150 3150 1200 3150
Wire Wire Line
	1150 3250 1200 3250
Wire Wire Line
	1150 3350 1200 3350
Wire Wire Line
	1150 3450 1200 3450
Wire Wire Line
	1150 3550 1200 3550
Wire Wire Line
	1150 3650 1200 3650
Wire Wire Line
	1150 3750 1200 3750
Wire Wire Line
	1150 3850 1200 3850
Text HLabel 1150 2050 0    60   Input ~ 0
WA0
Text HLabel 1150 2150 0    60   Input ~ 0
WA1
Text HLabel 1150 2250 0    60   Input ~ 0
WA2
Text HLabel 1150 2350 0    60   Input ~ 0
WA3
Text HLabel 1150 2450 0    60   Input ~ 0
WA4
Text HLabel 1150 2550 0    60   Input ~ 0
WA5
Text HLabel 1150 2650 0    60   Input ~ 0
WA6
Text HLabel 1150 2750 0    60   Input ~ 0
WA7
Text HLabel 1150 2850 0    60   Input ~ 0
WA8
Text HLabel 1150 2950 0    60   Input ~ 0
WA9
Text HLabel 1150 3050 0    60   Input ~ 0
WA10
Text HLabel 1150 3150 0    60   Input ~ 0
WA11
Text HLabel 1150 3250 0    60   Input ~ 0
WA12
Text HLabel 1150 3350 0    60   Input ~ 0
WA13
Text HLabel 1150 3450 0    60   Input ~ 0
WA14
Text HLabel 1150 3550 0    60   Input ~ 0
WA15
Text HLabel 1150 3650 0    60   Input ~ 0
WA16
Text HLabel 1150 3750 0    60   Input ~ 0
WA17
Text HLabel 1150 3850 0    60   Input ~ 0
WA18
Text HLabel 3250 2000 2    60   BiDi ~ 0
D0
Text HLabel 3250 2100 2    60   BiDi ~ 0
D1
Text HLabel 3250 2200 2    60   BiDi ~ 0
D2
Text HLabel 3250 2300 2    60   BiDi ~ 0
D3
Text HLabel 3250 2400 2    60   BiDi ~ 0
D4
Text HLabel 3250 2500 2    60   BiDi ~ 0
D5
Text HLabel 3250 2600 2    60   BiDi ~ 0
D6
Text HLabel 3250 2700 2    60   BiDi ~ 0
D7
Text HLabel 3250 2800 2    60   BiDi ~ 0
D8
Text HLabel 3250 2900 2    60   BiDi ~ 0
D9
Text HLabel 3250 3000 2    60   BiDi ~ 0
D10
Text HLabel 3250 3100 2    60   BiDi ~ 0
D11
Text HLabel 3250 3200 2    60   BiDi ~ 0
D12
Text HLabel 3250 3300 2    60   BiDi ~ 0
D13
Text HLabel 3250 3400 2    60   BiDi ~ 0
D14
Text HLabel 3250 3500 2    60   BiDi ~ 0
D15
Text HLabel 3250 3650 2    60   Input ~ 0
~CSROM
Text HLabel 3250 3850 2    60   Input ~ 0
~WE
Text HLabel 3250 3750 2    60   Input ~ 0
~RE
Wire Wire Line
	3200 3650 3250 3650
Wire Wire Line
	3200 3750 3250 3750
Text HLabel 6750 3700 2    60   Input ~ 0
~CSRAM1
$Comp
L C C5
U 1 1 551B8D70
P 2100 5200
F 0 "C5" H 2100 5300 40  0000 L CNN
F 1 "0.1uF" H 2106 5115 40  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2138 5050 30  0001 C CNN
F 3 "" H 2100 5200 60  0000 C CNN
	1    2100 5200
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 551B8D9C
P 2400 5200
F 0 "C6" H 2400 5300 40  0000 L CNN
F 1 "0.1uF" H 2406 5115 40  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2438 5050 30  0001 C CNN
F 3 "" H 2400 5200 60  0000 C CNN
	1    2400 5200
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR023
U 1 1 551B8DC6
P 2250 4850
F 0 "#PWR023" H 2250 4950 30  0001 C CNN
F 1 "VCC" H 2250 4950 30  0000 C CNN
F 2 "" H 2250 4850 60  0000 C CNN
F 3 "" H 2250 4850 60  0000 C CNN
	1    2250 4850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 551B8DED
P 2250 5550
F 0 "#PWR024" H 2250 5550 30  0001 C CNN
F 1 "GND" H 2250 5480 30  0001 C CNN
F 2 "" H 2250 5550 60  0000 C CNN
F 3 "" H 2250 5550 60  0000 C CNN
	1    2250 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5000 2100 4900
Wire Wire Line
	2100 4900 2400 4900
Wire Wire Line
	2250 4900 2250 4850
Wire Wire Line
	2400 4900 2400 5000
Connection ~ 2250 4900
Wire Wire Line
	2100 5400 2400 5400
Wire Wire Line
	2250 5400 2250 5550
Connection ~ 2250 5400
$Comp
L RAM_512K_16 U3
U 1 1 551BABAA
P 5700 3000
F 0 "U3" H 4950 4100 60  0000 C CNN
F 1 "RAM_512K_16" H 5700 3000 60  0000 C CNN
F 2 "SMD_Packages:PLCC-44" H 5150 3100 60  0001 C CNN
F 3 "" H 5150 3100 60  0000 C CNN
	1    5700 3000
	1    0    0    -1  
$EndComp
Text HLabel 10350 3700 2    60   Input ~ 0
~CSRAM2
$Comp
L RAM_512K_16 U4
U 1 1 551BAC69
P 9300 3000
F 0 "U4" H 8550 4100 60  0000 C CNN
F 1 "RAM_512K_16" H 9300 3000 60  0000 C CNN
F 2 "SMD_Packages:PLCC-44" H 8750 3100 60  0001 C CNN
F 3 "" H 8750 3100 60  0000 C CNN
	1    9300 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 3700 10350 3700
Wire Wire Line
	6700 3700 6750 3700
Wire Wire Line
	6700 2050 6750 2050
Wire Wire Line
	6700 2150 6750 2150
Wire Wire Line
	6700 2250 6750 2250
Wire Wire Line
	6700 2350 6750 2350
Wire Wire Line
	6700 2450 6750 2450
Wire Wire Line
	6700 2550 6750 2550
Wire Wire Line
	6700 2650 6750 2650
Wire Wire Line
	6700 2750 6750 2750
Wire Wire Line
	6700 2850 6750 2850
Wire Wire Line
	6700 2950 6750 2950
Wire Wire Line
	6700 3050 6750 3050
Wire Wire Line
	6700 3150 6750 3150
Wire Wire Line
	6700 3250 6750 3250
Wire Wire Line
	6700 3350 6750 3350
Wire Wire Line
	6700 3450 6750 3450
Wire Wire Line
	6700 3550 6750 3550
Text HLabel 6750 2050 2    60   BiDi ~ 0
D0
Text HLabel 6750 2150 2    60   BiDi ~ 0
D1
Text HLabel 6750 2250 2    60   BiDi ~ 0
D2
Text HLabel 6750 2350 2    60   BiDi ~ 0
D3
Text HLabel 6750 2450 2    60   BiDi ~ 0
D4
Text HLabel 6750 2550 2    60   BiDi ~ 0
D5
Text HLabel 6750 2650 2    60   BiDi ~ 0
D6
Text HLabel 6750 2750 2    60   BiDi ~ 0
D7
Text HLabel 6750 2850 2    60   BiDi ~ 0
D8
Text HLabel 6750 2950 2    60   BiDi ~ 0
D9
Text HLabel 6750 3050 2    60   BiDi ~ 0
D10
Text HLabel 6750 3150 2    60   BiDi ~ 0
D11
Text HLabel 6750 3250 2    60   BiDi ~ 0
D12
Text HLabel 6750 3350 2    60   BiDi ~ 0
D13
Text HLabel 6750 3450 2    60   BiDi ~ 0
D14
Text HLabel 6750 3550 2    60   BiDi ~ 0
D15
Wire Wire Line
	4650 2050 4700 2050
Wire Wire Line
	4650 2150 4700 2150
Wire Wire Line
	4650 2250 4700 2250
Wire Wire Line
	4650 2350 4700 2350
Wire Wire Line
	4650 2450 4700 2450
Wire Wire Line
	4650 2550 4700 2550
Wire Wire Line
	4650 2650 4700 2650
Wire Wire Line
	4650 2750 4700 2750
Wire Wire Line
	4650 2850 4700 2850
Wire Wire Line
	4650 2950 4700 2950
Wire Wire Line
	4650 3050 4700 3050
Wire Wire Line
	4650 3150 4700 3150
Wire Wire Line
	4650 3250 4700 3250
Wire Wire Line
	4650 3350 4700 3350
Wire Wire Line
	4650 3450 4700 3450
Wire Wire Line
	4650 3550 4700 3550
Wire Wire Line
	4650 3650 4700 3650
Wire Wire Line
	4650 3750 4700 3750
Wire Wire Line
	4650 3850 4700 3850
Text HLabel 4650 2050 0    60   Input ~ 0
WA0
Text HLabel 4650 2150 0    60   Input ~ 0
WA1
Text HLabel 4650 2250 0    60   Input ~ 0
WA2
Text HLabel 4650 2350 0    60   Input ~ 0
WA3
Text HLabel 4650 2450 0    60   Input ~ 0
WA4
Text HLabel 4650 2550 0    60   Input ~ 0
WA5
Text HLabel 4650 2650 0    60   Input ~ 0
WA6
Text HLabel 4650 2750 0    60   Input ~ 0
WA7
Text HLabel 4650 2850 0    60   Input ~ 0
WA8
Text HLabel 4650 2950 0    60   Input ~ 0
WA9
Text HLabel 4650 3050 0    60   Input ~ 0
WA10
Text HLabel 4650 3150 0    60   Input ~ 0
WA11
Text HLabel 4650 3250 0    60   Input ~ 0
WA12
Text HLabel 4650 3350 0    60   Input ~ 0
WA13
Text HLabel 4650 3450 0    60   Input ~ 0
WA14
Text HLabel 4650 3550 0    60   Input ~ 0
WA15
Text HLabel 4650 3650 0    60   Input ~ 0
WA16
Text HLabel 4650 3750 0    60   Input ~ 0
WA17
Text HLabel 4650 3850 0    60   Input ~ 0
WA18
Wire Wire Line
	8250 2050 8300 2050
Wire Wire Line
	8250 2150 8300 2150
Wire Wire Line
	8250 2250 8300 2250
Wire Wire Line
	8250 2350 8300 2350
Wire Wire Line
	8250 2450 8300 2450
Wire Wire Line
	8250 2550 8300 2550
Wire Wire Line
	8250 2650 8300 2650
Wire Wire Line
	8250 2750 8300 2750
Wire Wire Line
	8250 2850 8300 2850
Wire Wire Line
	8250 2950 8300 2950
Wire Wire Line
	8250 3050 8300 3050
Wire Wire Line
	8250 3150 8300 3150
Wire Wire Line
	8250 3250 8300 3250
Wire Wire Line
	8250 3350 8300 3350
Wire Wire Line
	8250 3450 8300 3450
Wire Wire Line
	8250 3550 8300 3550
Wire Wire Line
	8250 3650 8300 3650
Wire Wire Line
	8250 3750 8300 3750
Wire Wire Line
	8250 3850 8300 3850
Text HLabel 8250 2050 0    60   Input ~ 0
WA0
Text HLabel 8250 2150 0    60   Input ~ 0
WA1
Text HLabel 8250 2250 0    60   Input ~ 0
WA2
Text HLabel 8250 2350 0    60   Input ~ 0
WA3
Text HLabel 8250 2450 0    60   Input ~ 0
WA4
Text HLabel 8250 2550 0    60   Input ~ 0
WA5
Text HLabel 8250 2650 0    60   Input ~ 0
WA6
Text HLabel 8250 2750 0    60   Input ~ 0
WA7
Text HLabel 8250 2850 0    60   Input ~ 0
WA8
Text HLabel 8250 2950 0    60   Input ~ 0
WA9
Text HLabel 8250 3050 0    60   Input ~ 0
WA10
Text HLabel 8250 3150 0    60   Input ~ 0
WA11
Text HLabel 8250 3250 0    60   Input ~ 0
WA12
Text HLabel 8250 3350 0    60   Input ~ 0
WA13
Text HLabel 8250 3450 0    60   Input ~ 0
WA14
Text HLabel 8250 3550 0    60   Input ~ 0
WA15
Text HLabel 8250 3650 0    60   Input ~ 0
WA16
Text HLabel 8250 3750 0    60   Input ~ 0
WA17
Text HLabel 8250 3850 0    60   Input ~ 0
WA18
Wire Wire Line
	10300 2050 10350 2050
Wire Wire Line
	10300 2150 10350 2150
Wire Wire Line
	10300 2250 10350 2250
Wire Wire Line
	10300 2350 10350 2350
Wire Wire Line
	10300 2450 10350 2450
Wire Wire Line
	10300 2550 10350 2550
Wire Wire Line
	10300 2650 10350 2650
Wire Wire Line
	10300 2750 10350 2750
Wire Wire Line
	10300 2850 10350 2850
Wire Wire Line
	10300 2950 10350 2950
Wire Wire Line
	10300 3050 10350 3050
Wire Wire Line
	10300 3150 10350 3150
Wire Wire Line
	10300 3250 10350 3250
Wire Wire Line
	10300 3350 10350 3350
Wire Wire Line
	10300 3450 10350 3450
Wire Wire Line
	10300 3550 10350 3550
Text HLabel 10350 2050 2    60   BiDi ~ 0
D0
Text HLabel 10350 2150 2    60   BiDi ~ 0
D1
Text HLabel 10350 2250 2    60   BiDi ~ 0
D2
Text HLabel 10350 2350 2    60   BiDi ~ 0
D3
Text HLabel 10350 2450 2    60   BiDi ~ 0
D4
Text HLabel 10350 2550 2    60   BiDi ~ 0
D5
Text HLabel 10350 2650 2    60   BiDi ~ 0
D6
Text HLabel 10350 2750 2    60   BiDi ~ 0
D7
Text HLabel 10350 2850 2    60   BiDi ~ 0
D8
Text HLabel 10350 2950 2    60   BiDi ~ 0
D9
Text HLabel 10350 3050 2    60   BiDi ~ 0
D10
Text HLabel 10350 3150 2    60   BiDi ~ 0
D11
Text HLabel 10350 3250 2    60   BiDi ~ 0
D12
Text HLabel 10350 3350 2    60   BiDi ~ 0
D13
Text HLabel 10350 3450 2    60   BiDi ~ 0
D14
Text HLabel 10350 3550 2    60   BiDi ~ 0
D15
Text HLabel 6750 3800 2    60   Input ~ 0
~RE
Text HLabel 6750 3900 2    60   Input ~ 0
~WE
Text HLabel 6750 4000 2    60   Input ~ 0
~LB
Text HLabel 6750 4100 2    60   Input ~ 0
~UB
Text HLabel 10350 3800 2    60   Input ~ 0
~RE
Text HLabel 10350 3900 2    60   Input ~ 0
~WE
Text HLabel 10350 4000 2    60   Input ~ 0
~LB
Text HLabel 10350 4100 2    60   Input ~ 0
~UB
Wire Wire Line
	6700 3800 6750 3800
Wire Wire Line
	6700 3900 6750 3900
Wire Wire Line
	6700 4000 6750 4000
Wire Wire Line
	6700 4100 6750 4100
Wire Wire Line
	10300 3800 10350 3800
Wire Wire Line
	10300 3900 10350 3900
Wire Wire Line
	10300 4000 10350 4000
Wire Wire Line
	10300 4100 10350 4100
$Comp
L VCC #PWR025
U 1 1 551BB608
P 9300 1650
F 0 "#PWR025" H 9300 1750 30  0001 C CNN
F 1 "VCC" H 9300 1750 30  0000 C CNN
F 2 "" H 9300 1650 60  0000 C CNN
F 3 "" H 9300 1650 60  0000 C CNN
	1    9300 1650
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR026
U 1 1 551BB624
P 5700 1650
F 0 "#PWR026" H 5700 1750 30  0001 C CNN
F 1 "VCC" H 5700 1750 30  0000 C CNN
F 2 "" H 5700 1650 60  0000 C CNN
F 3 "" H 5700 1650 60  0000 C CNN
	1    5700 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 1650 9300 1700
Wire Wire Line
	9250 1700 9350 1700
Wire Wire Line
	9250 1700 9250 1750
Wire Wire Line
	9350 1700 9350 1750
Connection ~ 9300 1700
Wire Wire Line
	5700 1650 5700 1700
Wire Wire Line
	5650 1700 5750 1700
Wire Wire Line
	5650 1700 5650 1750
Wire Wire Line
	5750 1700 5750 1750
Connection ~ 5700 1700
$Comp
L GND #PWR027
U 1 1 551BB92A
P 5700 4500
F 0 "#PWR027" H 5700 4500 30  0001 C CNN
F 1 "GND" H 5700 4430 30  0001 C CNN
F 2 "" H 5700 4500 60  0000 C CNN
F 3 "" H 5700 4500 60  0000 C CNN
	1    5700 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR028
U 1 1 551BB96B
P 9300 4500
F 0 "#PWR028" H 9300 4500 30  0001 C CNN
F 1 "GND" H 9300 4430 30  0001 C CNN
F 2 "" H 9300 4500 60  0000 C CNN
F 3 "" H 9300 4500 60  0000 C CNN
	1    9300 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4400 9250 4450
Wire Wire Line
	9250 4450 9350 4450
Wire Wire Line
	9300 4450 9300 4500
Wire Wire Line
	9350 4450 9350 4400
Connection ~ 9300 4450
Wire Wire Line
	5650 4400 5650 4450
Wire Wire Line
	5650 4450 5750 4450
Wire Wire Line
	5700 4450 5700 4500
Wire Wire Line
	5750 4450 5750 4400
Connection ~ 5700 4450
$Comp
L C C7
U 1 1 551BBEBE
P 5550 5200
F 0 "C7" H 5550 5300 40  0000 L CNN
F 1 "0.1uF" H 5556 5115 40  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5588 5050 30  0001 C CNN
F 3 "" H 5550 5200 60  0000 C CNN
	1    5550 5200
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 551BBEC4
P 5850 5200
F 0 "C8" H 5850 5300 40  0000 L CNN
F 1 "0.1uF" H 5856 5115 40  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5888 5050 30  0001 C CNN
F 3 "" H 5850 5200 60  0000 C CNN
	1    5850 5200
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR029
U 1 1 551BBECA
P 5700 4850
F 0 "#PWR029" H 5700 4950 30  0001 C CNN
F 1 "VCC" H 5700 4950 30  0000 C CNN
F 2 "" H 5700 4850 60  0000 C CNN
F 3 "" H 5700 4850 60  0000 C CNN
	1    5700 4850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 551BBED0
P 5700 5550
F 0 "#PWR030" H 5700 5550 30  0001 C CNN
F 1 "GND" H 5700 5480 30  0001 C CNN
F 2 "" H 5700 5550 60  0000 C CNN
F 3 "" H 5700 5550 60  0000 C CNN
	1    5700 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5000 5550 4900
Wire Wire Line
	5550 4900 5850 4900
Wire Wire Line
	5700 4900 5700 4850
Wire Wire Line
	5850 4900 5850 5000
Connection ~ 5700 4900
Wire Wire Line
	5550 5400 5850 5400
Wire Wire Line
	5700 5400 5700 5550
Connection ~ 5700 5400
$Comp
L C C9
U 1 1 551BC22C
P 9150 5200
F 0 "C9" H 9150 5300 40  0000 L CNN
F 1 "0.1uF" H 9156 5115 40  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9188 5050 30  0001 C CNN
F 3 "" H 9150 5200 60  0000 C CNN
	1    9150 5200
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 551BC232
P 9450 5200
F 0 "C10" H 9450 5300 40  0000 L CNN
F 1 "0.1uF" H 9456 5115 40  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9488 5050 30  0001 C CNN
F 3 "" H 9450 5200 60  0000 C CNN
	1    9450 5200
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR031
U 1 1 551BC238
P 9300 4850
F 0 "#PWR031" H 9300 4950 30  0001 C CNN
F 1 "VCC" H 9300 4950 30  0000 C CNN
F 2 "" H 9300 4850 60  0000 C CNN
F 3 "" H 9300 4850 60  0000 C CNN
	1    9300 4850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 551BC23E
P 9300 5550
F 0 "#PWR032" H 9300 5550 30  0001 C CNN
F 1 "GND" H 9300 5480 30  0001 C CNN
F 2 "" H 9300 5550 60  0000 C CNN
F 3 "" H 9300 5550 60  0000 C CNN
	1    9300 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 5000 9150 4900
Wire Wire Line
	9150 4900 9450 4900
Wire Wire Line
	9300 4900 9300 4850
Wire Wire Line
	9450 4900 9450 5000
Connection ~ 9300 4900
Wire Wire Line
	9150 5400 9450 5400
Wire Wire Line
	9300 5400 9300 5550
Connection ~ 9300 5400
Text Notes 2400 1350 2    60   ~ 0
Flash ROM
Text Notes 5800 1350 2    60   ~ 0
RAM 1
Text Notes 9400 1350 2    60   ~ 0
RAM 2
Wire Notes Line
	3900 1300 3900 5800
Wire Notes Line
	7500 1300 7500 5800
$EndSCHEMATC
