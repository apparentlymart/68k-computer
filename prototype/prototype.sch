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
~IPL2
Text GLabel 2000 1600 2    60   Output ~ 0
~IPL0
Text GLabel 1100 1600 0    60   Output ~ 0
~IPL1
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
$Comp
L MC68SEC000 U?
U 1 1 5518D2BF
P 9400 2750
F 0 "U?" H 8750 4450 60  0000 C CNN
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
Wire Wire Line
	3350 1300 3400 1300
Wire Wire Line
	3350 1400 3400 1400
Wire Wire Line
	3350 1500 3400 1500
Wire Wire Line
	3350 1600 3400 1600
Wire Wire Line
	3350 1700 3400 1700
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
NoConn ~ 3400 3000
NoConn ~ 4200 3000
NoConn ~ 4200 3100
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
	4200 1700 4250 1700
Wire Wire Line
	4200 1600 4250 1600
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
Text GLabel 8450 3700 0    60   Output ~ 0
FC0
Text GLabel 8450 3800 0    60   Output ~ 0
FC1
Text GLabel 8450 3900 0    60   Output ~ 0
FC2
Wire Wire Line
	8450 3700 8500 3700
Wire Wire Line
	8450 3800 8500 3800
Wire Wire Line
	8450 3900 8500 3900
Text GLabel 8450 4000 0    60   Output ~ 0
R/~W
Wire Wire Line
	8450 4000 8500 4000
Text GLabel 8450 4200 0    60   Output ~ 0
~AS
Text GLabel 8450 4500 0    60   Output ~ 0
~BG
Text GLabel 8450 4400 0    60   Input ~ 0
~BR
Wire Wire Line
	8450 4200 8500 4200
Wire Wire Line
	8450 4400 8500 4400
Wire Wire Line
	8450 4500 8500 4500
$Comp
L VCC #PWR?
U 1 1 5518ED2A
P 6400 7400
F 0 "#PWR?" H 6400 7500 30  0001 C CNN
F 1 "VCC" H 6400 7500 30  0000 C CNN
F 2 "" H 6400 7400 60  0000 C CNN
F 3 "" H 6400 7400 60  0000 C CNN
	1    6400 7400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5518ED53
P 6650 7600
F 0 "#PWR?" H 6650 7600 30  0001 C CNN
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
Wire Wire Line
	6650 7550 6650 7600
Wire Wire Line
	6400 7400 6400 7450
$Comp
L VCC #PWR?
U 1 1 5518EEAA
P 9400 750
F 0 "#PWR?" H 9400 850 30  0001 C CNN
F 1 "VCC" H 9400 850 30  0000 C CNN
F 2 "" H 9400 750 60  0000 C CNN
F 3 "" H 9400 750 60  0000 C CNN
	1    9400 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 750  9400 800 
Wire Wire Line
	9350 800  9450 800 
Wire Wire Line
	9450 800  9450 900 
Wire Wire Line
	9350 800  9350 900 
Connection ~ 9400 800 
$Comp
L GND #PWR?
U 1 1 5518EFE0
P 9400 4950
F 0 "#PWR?" H 9400 4950 30  0001 C CNN
F 1 "GND" H 9400 4880 30  0001 C CNN
F 2 "" H 9400 4950 60  0000 C CNN
F 3 "" H 9400 4950 60  0000 C CNN
	1    9400 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4850 9400 4950
Wire Wire Line
	9300 4900 9500 4900
Wire Wire Line
	9500 4900 9500 4850
Connection ~ 9400 4900
Wire Wire Line
	9300 4900 9300 4850
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
Wire Wire Line
	4200 3200 4250 3200
Text GLabel 10300 3800 2    60   Input ~ 0
~HALT
Text GLabel 3350 3100 0    60   Output ~ 0
~AVEC
Wire Wire Line
	3350 3100 3400 3100
Text GLabel 10300 4100 2    60   Input ~ 0
~AVEC
Text GLabel 10300 4300 2    60   Input ~ 0
~IPL0
Text GLabel 10300 4400 2    60   Input ~ 0
~IPL1
Text GLabel 10300 4500 2    60   Input ~ 0
~IPL2
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
Text GLabel 10300 3900 2    60   Input ~ 0
~RESET
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
$Comp
L R R?
U 1 1 55190758
P 10600 3500
F 0 "R?" V 10680 3500 40  0000 C CNN
F 1 "10k" V 10607 3501 40  0000 C CNN
F 2 "" V 10530 3500 30  0000 C CNN
F 3 "" H 10600 3500 30  0000 C CNN
	1    10600 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	10250 3500 10350 3500
$Comp
L VCC #PWR?
U 1 1 55190866
P 10950 3400
F 0 "#PWR?" H 10950 3500 30  0001 C CNN
F 1 "VCC" H 10950 3500 30  0000 C CNN
F 2 "" H 10950 3400 60  0000 C CNN
F 3 "" H 10950 3400 60  0000 C CNN
	1    10950 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 3500 10950 3500
Wire Wire Line
	10950 3500 10950 3400
$EndSCHEMATC
