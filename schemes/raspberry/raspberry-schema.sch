EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Arcade Cabinet Raspberry Pi"
Date "2019"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 5DF6CF51
P 2900 3550
F 0 "A?" H 2900 2461 50  0001 C CNN
F 1 "Arduino_Nano_v3.x" H 2900 2461 50  0001 C CNN
F 2 "Module:Arduino_Nano" H 2900 3550 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 2900 3550 50  0001 C CNN
F 4 "Arduino Nano" H 2900 2461 50  0000 C CNN "Label"
	1    2900 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DF6E61A
P 2800 2300
F 0 "#PWR?" H 2800 2150 50  0001 C CNN
F 1 "+5V" H 2815 2473 50  0001 C CNN
F 2 "" H 2800 2300 50  0001 C CNN
F 3 "" H 2800 2300 50  0001 C CNN
F 4 "+5V (PSU Red)" H 2815 2473 50  0000 C CNN "Label"
	1    2800 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF6E9C2
P 3000 4750
F 0 "#PWR?" H 3000 4500 50  0001 C CNN
F 1 "GND" H 3005 4577 50  0000 C CNN
F 2 "" H 3000 4750 50  0001 C CNN
F 3 "" H 3000 4750 50  0001 C CNN
	1    3000 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2300 2800 2550
$Comp
L raspberry-schema-rescue:5V_Two_Channel_Relay_Module-Driver_Relay-pc-schema-rescue-raspberry-schema-rescue U?
U 1 1 5DF8752A
P 8500 3850
F 0 "U?" H 8500 4731 50  0001 C CNN
F 1 "5V_Two_Channel_Relay_Module" H 8500 4640 50  0001 C CNN
F 2 "" H 8900 4350 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/drv8860.pdf" H 8500 3750 50  0001 C CNN
F 4 "Two Channel Relay Module" H 8500 3223 50  0000 C CNN "Label"
	1    8500 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF8BF26
P 8500 4700
F 0 "#PWR?" H 8500 4450 50  0001 C CNN
F 1 "GND" H 8505 4527 50  0000 C CNN
F 2 "" H 8500 4700 50  0001 C CNN
F 3 "" H 8500 4700 50  0001 C CNN
	1    8500 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4450 8500 4550
$Comp
L power:+5V #PWR?
U 1 1 5DF8E66B
P 8500 2950
F 0 "#PWR?" H 8500 2800 50  0001 C CNN
F 1 "+5V" H 8515 3123 50  0001 C CNN
F 2 "" H 8500 2950 50  0001 C CNN
F 3 "" H 8500 2950 50  0001 C CNN
F 4 "+5VSB (PSU Purple)" H 8515 3123 50  0000 C CNN "Label"
	1    8500 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3150 8500 3100
Wire Wire Line
	8000 3850 7800 3850
Wire Wire Line
	7800 3850 7800 4550
Wire Wire Line
	7800 4550 8500 4550
Connection ~ 8500 4550
Wire Wire Line
	8500 4550 8500 4700
Text GLabel 9650 3950 2    50   Output ~ 0
230V_Screen_Phase
Wire Wire Line
	9000 3950 9650 3950
Text GLabel 9650 3850 2    50   Input ~ 0
230V_Phase
Wire Wire Line
	9000 3850 9650 3850
$Comp
L power:+12V #PWR?
U 1 1 5DF9AFA6
P 9400 2950
F 0 "#PWR?" H 9400 2800 50  0001 C CNN
F 1 "+12V" H 9415 3123 50  0001 C CNN
F 2 "" H 9400 2950 50  0001 C CNN
F 3 "" H 9400 2950 50  0001 C CNN
F 4 "+12V (PSU Yellow)" H 9415 3123 50  0000 C CNN "Label"
	1    9400 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 3550 9000 3550
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5DF9C90E
P 9850 4200
F 0 "J?" H 9930 4192 50  0001 L CNN
F 1 "Conn_01x02" H 9930 4101 50  0001 L CNN
F 2 "" H 9850 4200 50  0001 C CNN
F 3 "~" H 9850 4200 50  0001 C CNN
F 4 "Game Buttons Light (7V)" H 9930 4146 50  0000 L CNN "Label"
	1    9850 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4550 9650 4550
Wire Wire Line
	9000 3650 9400 3650
Wire Wire Line
	9400 3650 9400 4200
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5DF9DA3B
P 9850 4450
F 0 "J?" H 9930 4442 50  0001 L CNN
F 1 "Conn_01x02" H 9930 4351 50  0001 L CNN
F 2 "" H 9850 4450 50  0001 C CNN
F 3 "~" H 9850 4450 50  0001 C CNN
F 4 "Marquee Light (12V)" H 9930 4396 50  0000 L CNN "Label"
	1    9850 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4450 9650 4450
Wire Wire Line
	9650 4200 9400 4200
Connection ~ 9400 4200
Wire Wire Line
	9400 4200 9400 4450
Wire Wire Line
	8500 3100 9250 3100
Connection ~ 8500 3100
Wire Wire Line
	8500 3100 8500 2950
Wire Wire Line
	9400 2950 9400 3550
Wire Wire Line
	9250 4300 9250 3100
Wire Wire Line
	9250 4300 9650 4300
Wire Wire Line
	3000 4550 3000 4750
Text GLabel 1600 4250 0    50   Output ~ 0
PSU_Pwr_Green
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5DFBD53D
P 1400 3650
F 0 "J?" H 1480 3642 50  0001 L CNN
F 1 "Conn_01x02" H 1480 3551 50  0001 L CNN
F 2 "" H 1400 3650 50  0001 C CNN
F 3 "~" H 1400 3650 50  0001 C CNN
F 4 "Front Lighting Button Led" H 1318 3417 50  0000 C CNN "Label"
	1    1400 3650
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5DFBD536
P 1400 4000
F 0 "J?" H 1480 3992 50  0001 C CNN
F 1 "Conn_01x02" H 1480 3901 50  0001 C CNN
F 2 "" H 1400 4000 50  0001 C CNN
F 3 "~" H 1400 4000 50  0001 C CNN
F 4 "Front Power Button Led" H 1318 3767 50  0000 C CNN "Label"
	1    1400 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 3850 2400 3850
Wire Wire Line
	1600 4250 2250 4250
Wire Wire Line
	2250 4250 2250 3750
Wire Wire Line
	2250 3750 2400 3750
Wire Wire Line
	2400 3650 2200 3650
Wire Wire Line
	1600 3650 2150 3650
Wire Wire Line
	2150 3650 2150 3350
Wire Wire Line
	2150 3350 2400 3350
Wire Wire Line
	1600 4000 2150 4000
Wire Wire Line
	2150 4000 2150 3650
Connection ~ 2150 3650
Wire Wire Line
	1600 3900 2100 3900
Wire Wire Line
	2100 3900 2100 3550
Wire Wire Line
	2100 3550 2400 3550
Wire Wire Line
	1600 3550 2050 3550
Wire Wire Line
	2050 3550 2050 3450
Wire Wire Line
	2050 3450 2400 3450
Wire Wire Line
	6550 2900 7050 2900
Wire Wire Line
	7050 2900 7050 5050
Wire Wire Line
	7050 5050 2300 5050
Wire Wire Line
	2300 3850 2300 5050
Wire Wire Line
	4950 3400 4400 3400
Wire Wire Line
	4400 3400 4400 5000
Wire Wire Line
	4400 5000 2350 5000
Wire Wire Line
	2350 5000 2350 3950
Wire Wire Line
	2350 3950 2400 3950
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5E0A3B53
P 1400 2600
F 0 "J?" H 1480 2592 50  0001 L CNN
F 1 "Conn_01x02" H 1480 2501 50  0001 L CNN
F 2 "" H 1400 2600 50  0001 C CNN
F 3 "~" H 1400 2600 50  0001 C CNN
F 4 "Front Lighting Button" H 1318 2367 50  0000 C CNN "Label"
	1    1400 2600
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5E0A3B5A
P 1400 2950
F 0 "J?" H 1480 2942 50  0001 C CNN
F 1 "Conn_01x02" H 1480 2851 50  0001 C CNN
F 2 "" H 1400 2950 50  0001 C CNN
F 3 "~" H 1400 2950 50  0001 C CNN
F 4 "Front Power Button" H 1318 2717 50  0000 C CNN "Label"
	1    1400 2950
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0AFEA7
P 1650 3050
F 0 "#PWR?" H 1650 2800 50  0001 C CNN
F 1 "GND" H 1655 2877 50  0000 C CNN
F 2 "" H 1650 3050 50  0001 C CNN
F 3 "" H 1650 3050 50  0001 C CNN
	1    1650 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2950 1650 2950
Wire Wire Line
	1650 2950 1650 3050
Wire Wire Line
	1600 2600 1650 2600
Wire Wire Line
	1650 2600 1650 2950
Connection ~ 1650 2950
Wire Wire Line
	2400 3250 2050 3250
Wire Wire Line
	2050 2850 2050 3250
Wire Wire Line
	1600 2850 2050 2850
Wire Wire Line
	1600 2500 2100 2500
Wire Wire Line
	2100 2500 2100 3150
Wire Wire Line
	2100 3150 2400 3150
Wire Wire Line
	2200 5100 7750 5100
Wire Wire Line
	7750 5100 7750 3750
Wire Wire Line
	7750 3750 8000 3750
Wire Wire Line
	2200 3650 2200 5100
$Comp
L power:+5V #PWR?
U 1 1 5E0C73DF
P 5550 1900
F 0 "#PWR?" H 5550 1750 50  0001 C CNN
F 1 "+5V" H 5565 2073 50  0001 C CNN
F 2 "" H 5550 1900 50  0001 C CNN
F 3 "" H 5550 1900 50  0001 C CNN
F 4 "+5VSB (PSU Purple)" H 5565 2073 50  0000 C CNN "Label"
	1    5550 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 1900 5550 2100
$Comp
L Connector:Raspberry_Pi_2_3 J?
U 1 1 5DF69921
P 5750 3400
F 0 "J?" H 5750 4881 50  0001 C CNN
F 1 "Raspberry_Pi_2_3" H 5750 4790 50  0001 C CNN
F 2 "" H 5750 3400 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 5750 3400 50  0001 C CNN
F 4 "Rasperry Pi" H 5750 1989 50  0000 C BNN "Label"
	1    5750 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0D2C31
P 6050 4800
F 0 "#PWR?" H 6050 4550 50  0001 C CNN
F 1 "GND" H 6055 4627 50  0000 C CNN
F 2 "" H 6050 4800 50  0001 C CNN
F 3 "" H 6050 4800 50  0001 C CNN
	1    6050 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4800 6050 4700
$EndSCHEMATC
