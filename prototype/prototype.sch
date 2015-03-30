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
Sheet 1 2
Title "68k Computer Prototype"
Date ""
Rev "v0.1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_25X2 P1
U 1 1 551890A6
P 1550 2000
F 0 "P1" H 1550 3300 60  0000 C CNN
F 1 "CONN_25X2" V 1550 2000 50  0000 C CNN
F 2 "" H 1550 2000 60  0000 C CNN
F 3 "" H 1550 2000 60  0000 C CNN
	1    1550 2000
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
Text GLabel 4250 800  2    60   Output ~ 0
GND
Text GLabel 4250 900  2    60   Output ~ 0
GND
Text GLabel 3350 900  0    60   Output ~ 0
VCC
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
Text GLabel 2000 1500 2    60   Output ~ 0
~IPL2
Text GLabel 2000 1600 2    60   Output ~ 0
~IPL0
Text GLabel 1100 1600 0    60   Output ~ 0
~IPL1
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
Text GLabel 4250 3100 2    60   Output ~ 0
~CSROM
Text GLabel 4250 3000 2    60   Output ~ 0
~CSRAM2
Text GLabel 3350 3000 0    60   Output ~ 0
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
$Comp
L MC68SEC000 U1
U 1 1 5518D2BF
P 9400 2750
F 0 "U1" H 8750 4450 60  0000 C CNN
F 1 "MC68SEC000" H 9400 2750 60  0000 C CNN
F 2 "" H 9000 3800 60  0000 C CNN
F 3 "" H 9000 3800 60  0000 C CNN
	1    9400 2750
	1    0    0    -1  
$EndComp
NoConn ~ 8500 1200
Text GLabel 8450 1300 0    60   Output ~ 0
A1
Text GLabel 8450 1400 0    60   Output ~ 0
A2
Text GLabel 8450 1500 0    60   Output ~ 0
A3
Text GLabel 8450 1600 0    60   Output ~ 0
A4
Text GLabel 8450 1700 0    60   Output ~ 0
A5
Text GLabel 8450 1800 0    60   Output ~ 0
A6
Text GLabel 8450 1900 0    60   Output ~ 0
A7
Text GLabel 8450 2000 0    60   Output ~ 0
A8
Text GLabel 8450 2100 0    60   Output ~ 0
A9
Text GLabel 8450 2200 0    60   Output ~ 0
A10
Text GLabel 8450 2300 0    60   Output ~ 0
A11
Text GLabel 8450 2400 0    60   Output ~ 0
LA12
Text GLabel 8450 2500 0    60   Output ~ 0
LA13
Text GLabel 8450 2600 0    60   Output ~ 0
LA14
Text GLabel 8450 2700 0    60   Output ~ 0
LA15
Text GLabel 8450 2800 0    60   Output ~ 0
LA16
Text GLabel 8450 2900 0    60   Output ~ 0
LA17
Text GLabel 8450 3000 0    60   Output ~ 0
LA18
Text GLabel 8450 3100 0    60   Output ~ 0
LA19
Text GLabel 8450 3200 0    60   Output ~ 0
LA20
Text GLabel 8450 3300 0    60   Output ~ 0
LA21
Text GLabel 8450 3400 0    60   Output ~ 0
LA22
Text GLabel 8450 3500 0    60   Output ~ 0
LA23
Text GLabel 8450 3700 0    60   Output ~ 0
FC0
Text GLabel 8450 3800 0    60   Output ~ 0
FC1
Text GLabel 8450 3900 0    60   Output ~ 0
FC2
Text GLabel 8450 4000 0    60   Output ~ 0
R/~W
Text GLabel 8450 4200 0    60   Output ~ 0
~AS
Text GLabel 8450 4500 0    60   Output ~ 0
~BG
Text GLabel 8450 4400 0    60   Input ~ 0
~BR
$Comp
L VCC #PWR14
U 1 1 5518ED2A
P 6400 7400
F 0 "#PWR14" H 6400 7500 30  0001 C CNN
F 1 "VCC" H 6400 7500 30  0000 C CNN
F 2 "" H 6400 7400 60  0000 C CNN
F 3 "" H 6400 7400 60  0000 C CNN
	1    6400 7400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR15
U 1 1 5518ED53
P 6650 7600
F 0 "#PWR15" H 6650 7600 30  0001 C CNN
F 1 "GND" H 6650 7530 30  0001 C CNN
F 2 "" H 6650 7600 60  0000 C CNN
F 3 "" H 6650 7600 60  0000 C CNN
	1    6650 7600
	1    0    0    -1  
$EndComp
Text GLabel 6400 7450 3    60   Output ~ 0
VCC
Text GLabel 6650 7550 1    60   Output ~ 0
GND
$Comp
L VCC #PWR16
U 1 1 5518EEAA
P 9400 750
F 0 "#PWR16" H 9400 850 30  0001 C CNN
F 1 "VCC" H 9400 850 30  0000 C CNN
F 2 "" H 9400 750 60  0000 C CNN
F 3 "" H 9400 750 60  0000 C CNN
	1    9400 750 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR17
U 1 1 5518EFE0
P 9400 4950
F 0 "#PWR17" H 9400 4950 30  0001 C CNN
F 1 "GND" H 9400 4880 30  0001 C CNN
F 2 "" H 9400 4950 60  0000 C CNN
F 3 "" H 9400 4950 60  0000 C CNN
	1    9400 4950
	1    0    0    -1  
$EndComp
Text GLabel 10300 1200 2    60   BiDi ~ 0
D0
Text GLabel 10300 1300 2    60   BiDi ~ 0
D1
Text GLabel 10300 1400 2    60   BiDi ~ 0
D2
Text GLabel 10300 1500 2    60   BiDi ~ 0
D3
Text GLabel 10300 1600 2    60   BiDi ~ 0
D4
Text GLabel 10300 1700 2    60   BiDi ~ 0
D5
Text GLabel 10300 1800 2    60   BiDi ~ 0
D6
Text GLabel 10300 1900 2    60   BiDi ~ 0
D7
Text GLabel 10300 2000 2    60   BiDi ~ 0
D8
Text GLabel 10300 2100 2    60   BiDi ~ 0
D9
Text GLabel 10300 2200 2    60   BiDi ~ 0
D10
Text GLabel 10300 2300 2    60   BiDi ~ 0
D11
Text GLabel 10300 2400 2    60   BiDi ~ 0
D12
Text GLabel 10300 2500 2    60   BiDi ~ 0
D13
Text GLabel 10300 2600 2    60   BiDi ~ 0
D14
Text GLabel 10300 2700 2    60   BiDi ~ 0
D15
Text GLabel 10300 2900 2    60   Output ~ 0
~UDS
Text GLabel 10300 3000 2    60   Output ~ 0
~LDS
Text GLabel 10300 3200 2    60   Input ~ 0
~DTACK
Text GLabel 10300 3300 2    60   Input ~ 0
~BERR
Text GLabel 10300 3700 2    60   Input ~ 0
CLK
Text GLabel 4250 3200 2    60   Output ~ 0
~HALT
Text GLabel 10300 3800 2    60   Input ~ 0
~HALT
Text GLabel 3350 3100 0    60   Output ~ 0
~AVEC
Text GLabel 10300 4100 2    60   Input ~ 0
~AVEC
Text GLabel 10300 4300 2    60   Input ~ 0
~IPL0
Text GLabel 10300 4400 2    60   Input ~ 0
~IPL1
Text GLabel 10300 4500 2    60   Input ~ 0
~IPL2
Text GLabel 10300 3900 2    60   Input ~ 0
~RESET
$Comp
L R R1
U 1 1 55190758
P 10600 3500
F 0 "R1" V 10680 3500 40  0000 C CNN
F 1 "10k" V 10607 3501 40  0000 C CNN
F 2 "" V 10530 3500 30  0000 C CNN
F 3 "" H 10600 3500 30  0000 C CNN
	1    10600 3500
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR20
U 1 1 55190866
P 10950 3400
F 0 "#PWR20" H 10950 3500 30  0001 C CNN
F 1 "VCC" H 10950 3500 30  0000 C CNN
F 2 "" H 10950 3400 60  0000 C CNN
F 3 "" H 10950 3400 60  0000 C CNN
	1    10950 3400
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5519107D
P 9250 5750
F 0 "C2" H 9250 5850 40  0000 L CNN
F 1 "0.1uF" H 9256 5665 40  0000 L CNN
F 2 "" H 9288 5600 30  0000 C CNN
F 3 "" H 9250 5750 60  0000 C CNN
	1    9250 5750
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 551910BD
P 9550 5750
F 0 "C3" H 9550 5850 40  0000 L CNN
F 1 "0.1uF" H 9556 5665 40  0000 L CNN
F 2 "" H 9588 5600 30  0000 C CNN
F 3 "" H 9550 5750 60  0000 C CNN
	1    9550 5750
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 55191170
P 9850 5750
F 0 "C4" H 9850 5850 40  0000 L CNN
F 1 "0.1uF" H 9856 5665 40  0000 L CNN
F 2 "" H 9888 5600 30  0000 C CNN
F 3 "" H 9850 5750 60  0000 C CNN
	1    9850 5750
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5519119C
P 8950 5750
F 0 "C1" H 8950 5850 40  0000 L CNN
F 1 "0.1uF" H 8956 5665 40  0000 L CNN
F 2 "" H 8988 5600 30  0000 C CNN
F 3 "" H 8950 5750 60  0000 C CNN
	1    8950 5750
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR18
U 1 1 551911CA
P 9400 5350
F 0 "#PWR18" H 9400 5450 30  0001 C CNN
F 1 "VCC" H 9400 5450 30  0000 C CNN
F 2 "" H 9400 5350 60  0000 C CNN
F 3 "" H 9400 5350 60  0000 C CNN
	1    9400 5350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR19
U 1 1 551911E5
P 9400 6150
F 0 "#PWR19" H 9400 6150 30  0001 C CNN
F 1 "GND" H 9400 6080 30  0001 C CNN
F 2 "" H 9400 6150 60  0000 C CNN
F 3 "" H 9400 6150 60  0000 C CNN
	1    9400 6150
	1    0    0    -1  
$EndComp
Text GLabel 1100 3750 0    60   Input ~ 0
RED0
$Comp
L R R2
U 1 1 551926CF
P 1450 3750
F 0 "R2" V 1530 3750 40  0000 C CNN
F 1 "4k7" V 1457 3751 40  0000 C CNN
F 2 "" V 1380 3750 30  0000 C CNN
F 3 "" H 1450 3750 30  0000 C CNN
	1    1450 3750
	0    1    1    0   
$EndComp
Text GLabel 1100 3950 0    60   Input ~ 0
RED1
Text GLabel 1100 4150 0    60   Input ~ 0
RED2
Text GLabel 1100 4350 0    60   Input ~ 0
RED3
$Comp
L R R3
U 1 1 551928F7
P 1450 3950
F 0 "R3" V 1530 3950 40  0000 C CNN
F 1 "2k2" V 1457 3951 40  0000 C CNN
F 2 "" V 1380 3950 30  0000 C CNN
F 3 "" H 1450 3950 30  0000 C CNN
	1    1450 3950
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 55192923
P 1450 4150
F 0 "R4" V 1530 4150 40  0000 C CNN
F 1 "1k" V 1457 4151 40  0000 C CNN
F 2 "" V 1380 4150 30  0000 C CNN
F 3 "" H 1450 4150 30  0000 C CNN
	1    1450 4150
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 55192951
P 1450 4350
F 0 "R5" V 1530 4350 40  0000 C CNN
F 1 "560" V 1457 4351 40  0000 C CNN
F 2 "" V 1380 4350 30  0000 C CNN
F 3 "" H 1450 4350 30  0000 C CNN
	1    1450 4350
	0    1    1    0   
$EndComp
$Comp
L VGACONN P3
U 1 1 55192E7C
P 4300 5100
F 0 "P3" H 4350 6050 60  0000 C CNN
F 1 "VGACONN" H 4500 4050 60  0000 C CNN
F 2 "" H 4300 5700 60  0000 C CNN
F 3 "" H 4300 5700 60  0000 C CNN
	1    4300 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 800  2000 800 
Wire Wire Line
	1950 900  2000 900 
Wire Wire Line
	1100 900  1150 900 
Wire Wire Line
	3350 900  3400 900 
Wire Wire Line
	4200 800  4250 800 
Wire Wire Line
	4200 900  4250 900 
Wire Wire Line
	1100 1100 1150 1100
Wire Wire Line
	1100 1200 1150 1200
Wire Wire Line
	1950 1100 2000 1100
Wire Wire Line
	1950 1200 2000 1200
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
Wire Wire Line
	1950 1500 2000 1500
Wire Wire Line
	1950 1600 2000 1600
Wire Wire Line
	1100 1600 1150 1600
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
Wire Notes Line
	4700 600  4700 3600
Wire Notes Line
	600  3600 5200 3600
Wire Wire Line
	3350 1300 3400 1300
Wire Wire Line
	3350 1400 3400 1400
Wire Wire Line
	3350 1500 3400 1500
Wire Wire Line
	3350 1600 3400 1600
Wire Wire Line
	3350 1800 3400 1800
Wire Wire Line
	3350 1900 3400 1900
Wire Wire Line
	3350 2000 3400 2000
Wire Wire Line
	3350 2100 3400 2100
Wire Wire Line
	3350 2200 3400 2200
Wire Wire Line
	3350 2300 3400 2300
Wire Wire Line
	3350 2400 3400 2400
Wire Wire Line
	3350 2500 3400 2500
Wire Wire Line
	3350 2600 3400 2600
Wire Wire Line
	3350 2700 3400 2700
Wire Wire Line
	3350 2800 3400 2800
Wire Wire Line
	3350 2900 3400 2900
Wire Wire Line
	3350 3200 3400 3200
Wire Wire Line
	4200 2900 4250 2900
Wire Wire Line
	4200 2800 4250 2800
Wire Wire Line
	4200 2700 4250 2700
Wire Wire Line
	4200 2600 4250 2600
Wire Wire Line
	4200 2500 4250 2500
Wire Wire Line
	4200 2400 4250 2400
Wire Wire Line
	4200 2300 4250 2300
Wire Wire Line
	4200 2200 4250 2200
Wire Wire Line
	4200 2100 4250 2100
Wire Wire Line
	4200 2000 4250 2000
Wire Wire Line
	4200 1900 4250 1900
Wire Wire Line
	4200 1800 4250 1800
Wire Wire Line
	4200 1500 4250 1500
Wire Wire Line
	4200 1400 4250 1400
Wire Wire Line
	4200 1300 4250 1300
Wire Wire Line
	8450 1300 8500 1300
Wire Wire Line
	8450 1400 8500 1400
Wire Wire Line
	8450 1500 8500 1500
Wire Wire Line
	8450 1600 8500 1600
Wire Wire Line
	8450 1700 8500 1700
Wire Wire Line
	8450 1800 8500 1800
Wire Wire Line
	8450 1900 8500 1900
Wire Wire Line
	8450 2000 8500 2000
Wire Wire Line
	8450 2100 8500 2100
Wire Wire Line
	8450 2200 8500 2200
Wire Wire Line
	8450 2300 8500 2300
Wire Wire Line
	8450 2400 8500 2400
Wire Wire Line
	8450 2500 8500 2500
Wire Wire Line
	8450 2600 8500 2600
Wire Wire Line
	8450 2700 8500 2700
Wire Wire Line
	8450 2800 8500 2800
Wire Wire Line
	8450 2900 8500 2900
Wire Wire Line
	8450 3000 8500 3000
Wire Wire Line
	8450 3100 8500 3100
Wire Wire Line
	8450 3200 8500 3200
Wire Wire Line
	8450 3300 8500 3300
Wire Wire Line
	8450 3400 8500 3400
Wire Wire Line
	8450 3500 8500 3500
Wire Wire Line
	8450 3700 8500 3700
Wire Wire Line
	8450 3800 8500 3800
Wire Wire Line
	8450 3900 8500 3900
Wire Wire Line
	8450 4000 8500 4000
Wire Wire Line
	8450 4200 8500 4200
Wire Wire Line
	8450 4400 8500 4400
Wire Wire Line
	8450 4500 8500 4500
Wire Wire Line
	6650 7550 6650 7600
Wire Wire Line
	6400 7400 6400 7450
Wire Wire Line
	9400 750  9400 800 
Wire Wire Line
	9350 800  9450 800 
Wire Wire Line
	9450 800  9450 900 
Wire Wire Line
	9350 800  9350 900 
Connection ~ 9400 800 
Wire Wire Line
	9400 4850 9400 4950
Wire Wire Line
	9300 4900 9500 4900
Wire Wire Line
	9500 4900 9500 4850
Connection ~ 9400 4900
Wire Wire Line
	9300 4900 9300 4850
Wire Wire Line
	4200 3200 4250 3200
Wire Wire Line
	3350 3100 3400 3100
Wire Wire Line
	10250 1200 10300 1200
Wire Wire Line
	10250 1300 10300 1300
Wire Wire Line
	10250 1400 10300 1400
Wire Wire Line
	10250 1500 10300 1500
Wire Wire Line
	10250 1600 10300 1600
Wire Wire Line
	10250 1700 10300 1700
Wire Wire Line
	10250 1800 10300 1800
Wire Wire Line
	10250 1900 10300 1900
Wire Wire Line
	10250 2000 10300 2000
Wire Wire Line
	10250 2100 10300 2100
Wire Wire Line
	10250 2200 10300 2200
Wire Wire Line
	10250 2300 10300 2300
Wire Wire Line
	10250 2400 10300 2400
Wire Wire Line
	10250 2500 10300 2500
Wire Wire Line
	10250 2600 10300 2600
Wire Wire Line
	10250 2700 10300 2700
Wire Wire Line
	10250 2900 10300 2900
Wire Wire Line
	10250 3000 10300 3000
Wire Wire Line
	10250 3200 10300 3200
Wire Wire Line
	10250 3300 10300 3300
Wire Wire Line
	10250 3700 10300 3700
Wire Wire Line
	10250 3800 10300 3800
Wire Wire Line
	10250 3900 10300 3900
Wire Wire Line
	10250 4100 10300 4100
Wire Wire Line
	10250 4300 10300 4300
Wire Wire Line
	10250 4400 10300 4400
Wire Wire Line
	10250 4500 10300 4500
Wire Wire Line
	10250 3500 10350 3500
Wire Wire Line
	10850 3500 10950 3500
Wire Wire Line
	10950 3500 10950 3400
Wire Wire Line
	9400 5450 9400 5350
Wire Wire Line
	8950 5450 9850 5450
Wire Wire Line
	9250 5450 9250 5550
Wire Wire Line
	8950 5450 8950 5550
Connection ~ 9250 5450
Wire Wire Line
	9550 5450 9550 5550
Connection ~ 9400 5450
Wire Wire Line
	9850 5450 9850 5550
Connection ~ 9550 5450
Wire Wire Line
	9400 6150 9400 6050
Wire Wire Line
	8950 6050 9850 6050
Wire Wire Line
	8950 6050 8950 5950
Wire Wire Line
	9250 6050 9250 5950
Connection ~ 9250 6050
Wire Wire Line
	9550 6050 9550 5950
Connection ~ 9400 6050
Wire Wire Line
	9850 6050 9850 5950
Connection ~ 9550 6050
Wire Notes Line
	7700 600  7700 6400
Wire Wire Line
	1100 3750 1200 3750
Wire Wire Line
	1100 3950 1200 3950
Wire Wire Line
	1100 4150 1200 4150
Wire Wire Line
	1100 4350 1200 4350
Wire Wire Line
	1700 3950 1800 3950
Wire Wire Line
	1800 3750 1800 4350
Wire Wire Line
	1800 4150 1700 4150
Wire Wire Line
	1700 3750 1800 3750
Connection ~ 1800 3950
Wire Wire Line
	1700 4350 2650 4350
Connection ~ 1800 4150
$Comp
L DIODE D5
U 1 1 55193320
P 2400 4150
F 0 "D5" H 2400 4250 40  0000 C CNN
F 1 "DIODE" H 2400 4050 40  0000 C CNN
F 2 "" H 2400 4150 60  0000 C CNN
F 3 "" H 2400 4150 60  0000 C CNN
	1    2400 4150
	1    0    0    -1  
$EndComp
$Comp
L DIODE D8
U 1 1 55193371
P 2900 4150
F 0 "D8" H 2900 4250 40  0000 C CNN
F 1 "DIODE" H 2900 4050 40  0000 C CNN
F 2 "" H 2900 4150 60  0000 C CNN
F 3 "" H 2900 4150 60  0000 C CNN
	1    2900 4150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR3
U 1 1 5519346A
P 2150 4150
F 0 "#PWR3" H 2150 4150 30  0001 C CNN
F 1 "GND" H 2150 4080 30  0001 C CNN
F 2 "" H 2150 4150 60  0000 C CNN
F 3 "" H 2150 4150 60  0000 C CNN
	1    2150 4150
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR8
U 1 1 5519348D
P 3150 4150
F 0 "#PWR8" H 3150 4250 30  0001 C CNN
F 1 "VCC" H 3150 4250 30  0000 C CNN
F 2 "" H 3150 4150 60  0000 C CNN
F 3 "" H 3150 4150 60  0000 C CNN
	1    3150 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 4150 2200 4150
Wire Wire Line
	2600 4150 2700 4150
Wire Wire Line
	3100 4150 3150 4150
Wire Wire Line
	2650 4150 2650 4500
Connection ~ 1800 4350
Connection ~ 2650 4150
Text GLabel 1100 4750 0    60   Input ~ 0
GREEN0
$Comp
L R R6
U 1 1 55193CFF
P 1450 4750
F 0 "R6" V 1530 4750 40  0000 C CNN
F 1 "4k7" V 1457 4751 40  0000 C CNN
F 2 "" V 1380 4750 30  0000 C CNN
F 3 "" H 1450 4750 30  0000 C CNN
	1    1450 4750
	0    1    1    0   
$EndComp
Text GLabel 1100 4950 0    60   Input ~ 0
GREEN1
Text GLabel 1100 5150 0    60   Input ~ 0
GREEN2
Text GLabel 1100 5350 0    60   Input ~ 0
GREEN3
$Comp
L R R7
U 1 1 55193D08
P 1450 4950
F 0 "R7" V 1530 4950 40  0000 C CNN
F 1 "2k2" V 1457 4951 40  0000 C CNN
F 2 "" V 1380 4950 30  0000 C CNN
F 3 "" H 1450 4950 30  0000 C CNN
	1    1450 4950
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 55193D0E
P 1450 5150
F 0 "R8" V 1530 5150 40  0000 C CNN
F 1 "1k" V 1457 5151 40  0000 C CNN
F 2 "" V 1380 5150 30  0000 C CNN
F 3 "" H 1450 5150 30  0000 C CNN
	1    1450 5150
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 55193D14
P 1450 5350
F 0 "R9" V 1530 5350 40  0000 C CNN
F 1 "560" V 1457 5351 40  0000 C CNN
F 2 "" V 1380 5350 30  0000 C CNN
F 3 "" H 1450 5350 30  0000 C CNN
	1    1450 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	1100 4750 1200 4750
Wire Wire Line
	1100 4950 1200 4950
Wire Wire Line
	1100 5150 1200 5150
Wire Wire Line
	1100 5350 1200 5350
Wire Wire Line
	1700 4950 1800 4950
Wire Wire Line
	1800 4750 1800 5350
Wire Wire Line
	1800 5150 1700 5150
Wire Wire Line
	1700 4750 1800 4750
Connection ~ 1800 4950
Wire Wire Line
	1700 5350 2650 5350
Connection ~ 1800 5150
$Comp
L DIODE D6
U 1 1 55193D25
P 2400 5150
F 0 "D6" H 2400 5250 40  0000 C CNN
F 1 "DIODE" H 2400 5050 40  0000 C CNN
F 2 "" H 2400 5150 60  0000 C CNN
F 3 "" H 2400 5150 60  0000 C CNN
	1    2400 5150
	1    0    0    -1  
$EndComp
$Comp
L DIODE D9
U 1 1 55193D2B
P 2900 5150
F 0 "D9" H 2900 5250 40  0000 C CNN
F 1 "DIODE" H 2900 5050 40  0000 C CNN
F 2 "" H 2900 5150 60  0000 C CNN
F 3 "" H 2900 5150 60  0000 C CNN
	1    2900 5150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR4
U 1 1 55193D31
P 2150 5150
F 0 "#PWR4" H 2150 5150 30  0001 C CNN
F 1 "GND" H 2150 5080 30  0001 C CNN
F 2 "" H 2150 5150 60  0000 C CNN
F 3 "" H 2150 5150 60  0000 C CNN
	1    2150 5150
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR9
U 1 1 55193D37
P 3150 5150
F 0 "#PWR9" H 3150 5250 30  0001 C CNN
F 1 "VCC" H 3150 5250 30  0000 C CNN
F 2 "" H 3150 5150 60  0000 C CNN
F 3 "" H 3150 5150 60  0000 C CNN
	1    3150 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 5150 2200 5150
Wire Wire Line
	2600 5150 2700 5150
Wire Wire Line
	3100 5150 3150 5150
Wire Wire Line
	2650 5150 2650 5500
Connection ~ 1800 5350
Connection ~ 2650 5150
Text GLabel 1100 5750 0    60   Input ~ 0
BLUE0
$Comp
L R R10
U 1 1 551940F6
P 1450 5750
F 0 "R10" V 1530 5750 40  0000 C CNN
F 1 "4k7" V 1457 5751 40  0000 C CNN
F 2 "" V 1380 5750 30  0000 C CNN
F 3 "" H 1450 5750 30  0000 C CNN
	1    1450 5750
	0    1    1    0   
$EndComp
Text GLabel 1100 5950 0    60   Input ~ 0
BLUE1
Text GLabel 1100 6150 0    60   Input ~ 0
BLUE2
Text GLabel 1100 6350 0    60   Input ~ 0
BLUE3
$Comp
L R R11
U 1 1 551940FF
P 1450 5950
F 0 "R11" V 1530 5950 40  0000 C CNN
F 1 "2k2" V 1457 5951 40  0000 C CNN
F 2 "" V 1380 5950 30  0000 C CNN
F 3 "" H 1450 5950 30  0000 C CNN
	1    1450 5950
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 55194105
P 1450 6150
F 0 "R12" V 1530 6150 40  0000 C CNN
F 1 "1k" V 1457 6151 40  0000 C CNN
F 2 "" V 1380 6150 30  0000 C CNN
F 3 "" H 1450 6150 30  0000 C CNN
	1    1450 6150
	0    1    1    0   
$EndComp
$Comp
L R R13
U 1 1 5519410B
P 1450 6350
F 0 "R13" V 1530 6350 40  0000 C CNN
F 1 "560" V 1457 6351 40  0000 C CNN
F 2 "" V 1380 6350 30  0000 C CNN
F 3 "" H 1450 6350 30  0000 C CNN
	1    1450 6350
	0    1    1    0   
$EndComp
Wire Wire Line
	1100 5750 1200 5750
Wire Wire Line
	1100 5950 1200 5950
Wire Wire Line
	1100 6150 1200 6150
Wire Wire Line
	1100 6350 1200 6350
Wire Wire Line
	1700 5950 1800 5950
Wire Wire Line
	1800 5750 1800 6350
Wire Wire Line
	1800 6150 1700 6150
Wire Wire Line
	1700 5750 1800 5750
Connection ~ 1800 5950
Wire Wire Line
	1700 6350 2650 6350
Connection ~ 1800 6150
$Comp
L DIODE D7
U 1 1 5519411C
P 2400 6150
F 0 "D7" H 2400 6250 40  0000 C CNN
F 1 "DIODE" H 2400 6050 40  0000 C CNN
F 2 "" H 2400 6150 60  0000 C CNN
F 3 "" H 2400 6150 60  0000 C CNN
	1    2400 6150
	1    0    0    -1  
$EndComp
$Comp
L DIODE D10
U 1 1 55194122
P 2900 6150
F 0 "D10" H 2900 6250 40  0000 C CNN
F 1 "DIODE" H 2900 6050 40  0000 C CNN
F 2 "" H 2900 6150 60  0000 C CNN
F 3 "" H 2900 6150 60  0000 C CNN
	1    2900 6150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR5
U 1 1 55194128
P 2150 6150
F 0 "#PWR5" H 2150 6150 30  0001 C CNN
F 1 "GND" H 2150 6080 30  0001 C CNN
F 2 "" H 2150 6150 60  0000 C CNN
F 3 "" H 2150 6150 60  0000 C CNN
	1    2150 6150
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR10
U 1 1 5519412E
P 3150 6150
F 0 "#PWR10" H 3150 6250 30  0001 C CNN
F 1 "VCC" H 3150 6250 30  0000 C CNN
F 2 "" H 3150 6150 60  0000 C CNN
F 3 "" H 3150 6150 60  0000 C CNN
	1    3150 6150
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 6150 2200 6150
Wire Wire Line
	2600 6150 2700 6150
Wire Wire Line
	3100 6150 3150 6150
Wire Wire Line
	2650 6150 2650 6500
Connection ~ 1800 6350
Connection ~ 2650 6150
Text GLabel 2750 5500 2    60   Output ~ 0
GREEN
Wire Wire Line
	2650 5500 2750 5500
Connection ~ 2650 5350
Text GLabel 2750 6500 2    60   Output ~ 0
BLUE
Wire Wire Line
	2650 6500 2750 6500
Connection ~ 2650 6350
Text GLabel 2750 4500 2    60   Output ~ 0
RED
Wire Wire Line
	2650 4500 2750 4500
Connection ~ 2650 4350
Text GLabel 750  7150 2    60   Output ~ 0
HSYNC
$Comp
L DIODE D2
U 1 1 551954A0
P 1250 7400
F 0 "D2" H 1250 7500 40  0000 C CNN
F 1 "DIODE" H 1250 7300 40  0000 C CNN
F 2 "" H 1250 7400 60  0000 C CNN
F 3 "" H 1250 7400 60  0000 C CNN
	1    1250 7400
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D1
U 1 1 5519554C
P 1250 6900
F 0 "D1" H 1250 7000 40  0000 C CNN
F 1 "DIODE" H 1250 6800 40  0000 C CNN
F 2 "" H 1250 6900 60  0000 C CNN
F 3 "" H 1250 6900 60  0000 C CNN
	1    1250 6900
	0    1    1    0   
$EndComp
Wire Wire Line
	1250 7100 1250 7200
Wire Wire Line
	1100 7150 1250 7150
Connection ~ 1250 7150
$Comp
L VCC #PWR1
U 1 1 5519604F
P 1250 6650
F 0 "#PWR1" H 1250 6750 30  0001 C CNN
F 1 "VCC" H 1250 6750 30  0000 C CNN
F 2 "" H 1250 6650 60  0000 C CNN
F 3 "" H 1250 6650 60  0000 C CNN
	1    1250 6650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2
U 1 1 55196080
P 1250 7650
F 0 "#PWR2" H 1250 7650 30  0001 C CNN
F 1 "GND" H 1250 7580 30  0001 C CNN
F 2 "" H 1250 7650 60  0000 C CNN
F 3 "" H 1250 7650 60  0000 C CNN
	1    1250 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 6650 1250 6700
Wire Wire Line
	1250 7600 1250 7650
Text GLabel 1700 7150 2    60   Output ~ 0
VSYNC
$Comp
L DIODE D4
U 1 1 55196429
P 2200 7400
F 0 "D4" H 2200 7500 40  0000 C CNN
F 1 "DIODE" H 2200 7300 40  0000 C CNN
F 2 "" H 2200 7400 60  0000 C CNN
F 3 "" H 2200 7400 60  0000 C CNN
	1    2200 7400
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D3
U 1 1 5519642F
P 2200 6900
F 0 "D3" H 2200 7000 40  0000 C CNN
F 1 "DIODE" H 2200 6800 40  0000 C CNN
F 2 "" H 2200 6900 60  0000 C CNN
F 3 "" H 2200 6900 60  0000 C CNN
	1    2200 6900
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 7100 2200 7200
Wire Wire Line
	2050 7150 2200 7150
Connection ~ 2200 7150
$Comp
L VCC #PWR6
U 1 1 55196438
P 2200 6650
F 0 "#PWR6" H 2200 6750 30  0001 C CNN
F 1 "VCC" H 2200 6750 30  0000 C CNN
F 2 "" H 2200 6650 60  0000 C CNN
F 3 "" H 2200 6650 60  0000 C CNN
	1    2200 6650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR7
U 1 1 5519643E
P 2200 7650
F 0 "#PWR7" H 2200 7650 30  0001 C CNN
F 1 "GND" H 2200 7580 30  0001 C CNN
F 2 "" H 2200 7650 60  0000 C CNN
F 3 "" H 2200 7650 60  0000 C CNN
	1    2200 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 6650 2200 6700
Wire Wire Line
	2200 7600 2200 7650
Text GLabel 4050 4300 0    60   Input ~ 0
RED
Text GLabel 4050 4400 0    60   Input ~ 0
GREEN
Text GLabel 4050 4500 0    60   Input ~ 0
BLUE
Text GLabel 4050 4700 0    60   Input ~ 0
HSYNC
Text GLabel 4050 4800 0    60   Input ~ 0
VSYNC
$Comp
L GND #PWR11
U 1 1 55196C8F
P 4000 6100
F 0 "#PWR11" H 4000 6100 30  0001 C CNN
F 1 "GND" H 4000 6030 30  0001 C CNN
F 2 "" H 4000 6100 60  0000 C CNN
F 3 "" H 4000 6100 60  0000 C CNN
	1    4000 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5600 4000 5600
Wire Wire Line
	4100 5700 4000 5700
Wire Wire Line
	4000 5800 4100 5800
Wire Wire Line
	4000 5900 4100 5900
Wire Wire Line
	4000 6000 4100 6000
$Comp
L GND #PWR12
U 1 1 5519790D
P 4900 3950
F 0 "#PWR12" H 4900 3950 30  0001 C CNN
F 1 "GND" H 4900 3880 30  0001 C CNN
F 2 "" H 4900 3950 60  0000 C CNN
F 3 "" H 4900 3950 60  0000 C CNN
	1    4900 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 4000 4900 3950
$Comp
L GND #PWR13
U 1 1 55197AE6
P 4900 6350
F 0 "#PWR13" H 4900 6350 30  0001 C CNN
F 1 "GND" H 4900 6280 30  0001 C CNN
F 2 "" H 4900 6350 60  0000 C CNN
F 3 "" H 4900 6350 60  0000 C CNN
	1    4900 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6300 4900 6350
Wire Notes Line
	5200 3600 5200 6600
Wire Notes Line
	5200 6600 3300 6600
Wire Notes Line
	3300 6600 3300 7700
Wire Wire Line
	4000 5600 4000 6100
Connection ~ 4000 5700
Connection ~ 4000 5800
Connection ~ 4000 5900
Connection ~ 4000 6000
NoConn ~ 4100 5000
NoConn ~ 4100 5100
NoConn ~ 4100 5200
NoConn ~ 4100 5300
NoConn ~ 4100 5400
Wire Wire Line
	4050 4300 4100 4300
Wire Wire Line
	4050 4400 4100 4400
Wire Wire Line
	4050 4500 4100 4500
Wire Wire Line
	4050 4700 4100 4700
Wire Wire Line
	4050 4800 4100 4800
Text GLabel 7250 3050 2    60   Input ~ 0
~CSROM
Text GLabel 7250 950  2    60   BiDi ~ 0
D0
Text GLabel 7250 1050 2    60   BiDi ~ 0
D1
Text GLabel 7250 1150 2    60   BiDi ~ 0
D2
Text GLabel 7250 1250 2    60   BiDi ~ 0
D3
Text GLabel 7250 1350 2    60   BiDi ~ 0
D4
Text GLabel 7250 1450 2    60   BiDi ~ 0
D5
Text GLabel 7250 1550 2    60   BiDi ~ 0
D6
Text GLabel 7250 1650 2    60   BiDi ~ 0
D7
Text GLabel 7250 1750 2    60   BiDi ~ 0
D8
Text GLabel 7250 1850 2    60   BiDi ~ 0
D9
Text GLabel 7250 1950 2    60   BiDi ~ 0
D10
Text GLabel 7250 2050 2    60   BiDi ~ 0
D11
Text GLabel 7250 2150 2    60   BiDi ~ 0
D12
Text GLabel 7250 2250 2    60   BiDi ~ 0
D13
Text GLabel 7250 2350 2    60   BiDi ~ 0
D14
Text GLabel 7250 2450 2    60   BiDi ~ 0
D15
$Comp
L CONN_25X2 P2
U 1 1 551890D2
P 3800 2000
F 0 "P2" H 3800 3300 60  0000 C CNN
F 1 "CONN_25X2" V 3800 2000 50  0000 C CNN
F 2 "" H 3800 2000 60  0000 C CNN
F 3 "" H 3800 2000 60  0000 C CNN
	1    3800 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3000 3400 3000
Wire Wire Line
	4250 3000 4200 3000
Wire Wire Line
	4250 3100 4200 3100
Text GLabel 4250 1600 2    60   Output ~ 0
PA19
Wire Wire Line
	4200 1600 4250 1600
Text GLabel 5100 950  0    60   Input ~ 0
A1
Text GLabel 5100 1050 0    60   Input ~ 0
A2
Text GLabel 5100 1150 0    60   Input ~ 0
A3
Text GLabel 5100 1250 0    60   Input ~ 0
A4
Text GLabel 5100 1350 0    60   Input ~ 0
A5
Text GLabel 5100 1450 0    60   Input ~ 0
A6
Text GLabel 5100 1550 0    60   Input ~ 0
A7
Text GLabel 5100 1650 0    60   Input ~ 0
A8
Text GLabel 5100 1750 0    60   Input ~ 0
A9
Text GLabel 5100 1850 0    60   Input ~ 0
A10
Text GLabel 5100 1950 0    60   Input ~ 0
A11
Text GLabel 5100 2050 0    60   Input ~ 0
PA12
Text GLabel 5100 2150 0    60   Input ~ 0
PA13
Text GLabel 5100 2250 0    60   Input ~ 0
PA14
Text GLabel 5100 2350 0    60   Input ~ 0
PA15
Text GLabel 5100 2450 0    60   Input ~ 0
PA16
Text GLabel 5100 2550 0    60   Input ~ 0
PA17
Text GLabel 5100 2650 0    60   Input ~ 0
PA18
Text GLabel 5100 2750 0    60   Input ~ 0
PA19
$Sheet
S 5150 850  2050 2300
U 551A40FD
F0 "Memory" 60
F1 "prototype-mem.sch" 60
F2 "WA0" I L 5150 950 60 
F3 "WA1" I L 5150 1050 60 
F4 "WA2" I L 5150 1150 60 
F5 "WA3" I L 5150 1250 60 
F6 "WA4" I L 5150 1350 60 
F7 "WA5" I L 5150 1450 60 
F8 "WA6" I L 5150 1550 60 
F9 "WA7" I L 5150 1650 60 
F10 "WA8" I L 5150 1750 60 
F11 "WA9" I L 5150 1850 60 
F12 "WA10" I L 5150 1950 60 
F13 "WA11" I L 5150 2050 60 
F14 "WA12" I L 5150 2150 60 
F15 "WA13" I L 5150 2250 60 
F16 "WA14" I L 5150 2350 60 
F17 "WA15" I L 5150 2450 60 
F18 "WA16" I L 5150 2550 60 
F19 "WA17" I L 5150 2650 60 
F20 "WA18" I L 5150 2750 60 
F21 "D0" B R 7200 950 60 
F22 "D1" B R 7200 1050 60 
F23 "D2" B R 7200 1150 60 
F24 "D3" B R 7200 1250 60 
F25 "D4" B R 7200 1350 60 
F26 "D5" B R 7200 1450 60 
F27 "D6" B R 7200 1550 60 
F28 "D7" B R 7200 1650 60 
F29 "D8" B R 7200 1750 60 
F30 "D9" B R 7200 1850 60 
F31 "D10" B R 7200 1950 60 
F32 "D11" B R 7200 2050 60 
F33 "D12" B R 7200 2150 60 
F34 "D13" B R 7200 2250 60 
F35 "D14" B R 7200 2350 60 
F36 "D15" B R 7200 2450 60 
F37 "~CSROM" I R 7200 3050 60 
F38 "~WE" I L 5150 2950 60 
F39 "~RE" I L 5150 3050 60 
F40 "~CSRAM1" I R 7200 2850 60 
F41 "~CSRAM2" I R 7200 2950 60 
F42 "~LB" I R 7200 2600 60 
F43 "~UB" I R 7200 2700 60 
$EndSheet
Wire Wire Line
	5100 950  5150 950 
Wire Wire Line
	5100 1050 5150 1050
Wire Wire Line
	5100 1150 5150 1150
Wire Wire Line
	5100 1250 5150 1250
Wire Wire Line
	5100 1350 5150 1350
Wire Wire Line
	5100 1450 5150 1450
Wire Wire Line
	5100 1550 5150 1550
Wire Wire Line
	5100 1650 5150 1650
Wire Wire Line
	5100 1750 5150 1750
Wire Wire Line
	5100 1850 5150 1850
Wire Wire Line
	5100 1950 5150 1950
Wire Wire Line
	5100 2050 5150 2050
Wire Wire Line
	5100 2150 5150 2150
Wire Wire Line
	5100 2250 5150 2250
Wire Wire Line
	5100 2350 5150 2350
Wire Wire Line
	5100 2450 5150 2450
Wire Wire Line
	5100 2550 5150 2550
Wire Wire Line
	5100 2650 5150 2650
Wire Wire Line
	5100 2750 5150 2750
Wire Wire Line
	7200 950  7250 950 
Wire Wire Line
	7200 1050 7250 1050
Wire Wire Line
	7200 1150 7250 1150
Wire Wire Line
	7200 1250 7250 1250
Wire Wire Line
	7200 1350 7250 1350
Wire Wire Line
	7200 1450 7250 1450
Wire Wire Line
	7200 1550 7250 1550
Wire Wire Line
	7200 1650 7250 1650
Wire Wire Line
	7200 1750 7250 1750
Wire Wire Line
	7200 1850 7250 1850
Wire Wire Line
	7200 1950 7250 1950
Wire Wire Line
	7200 2050 7250 2050
Wire Wire Line
	7200 2150 7250 2150
Wire Wire Line
	7200 2250 7250 2250
Wire Wire Line
	7200 2350 7250 2350
Wire Wire Line
	7200 2450 7250 2450
Text GLabel 3350 1700 0    60   Output ~ 0
~RE
Text GLabel 4250 1700 2    60   Output ~ 0
~WE
Wire Wire Line
	3350 1700 3400 1700
Wire Wire Line
	4200 1700 4250 1700
Text GLabel 5100 3050 0    60   Input ~ 0
~RE
Text GLabel 5100 2950 0    60   Input ~ 0
~WE
Wire Wire Line
	5100 2950 5150 2950
Wire Wire Line
	5100 3050 5150 3050
Wire Wire Line
	7200 3050 7250 3050
Text GLabel 7250 2850 2    60   Input ~ 0
~CSRAM1
Text GLabel 7250 2950 2    60   Input ~ 0
~CSRAM2
Text GLabel 7250 2600 2    60   Input ~ 0
~LDS
Text GLabel 7250 2700 2    60   Input ~ 0
~UDS
Wire Wire Line
	7200 2950 7250 2950
Wire Wire Line
	7200 2850 7250 2850
Wire Wire Line
	7200 2700 7250 2700
Wire Wire Line
	7200 2600 7250 2600
$EndSCHEMATC
