EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Arcade Cabinet PC"
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
P 4100 3550
F 0 "A?" H 4100 2461 50  0001 C CNN
F 1 "Arduino_Nano_v3.x" H 4100 2461 50  0001 C CNN
F 2 "Module:Arduino_Nano" H 4100 3550 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4100 3550 50  0001 C CNN
F 4 "Arduino Nano" H 4100 2461 50  0000 C CNN "Label"
	1    4100 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DF6E61A
P 4000 2300
F 0 "#PWR?" H 4000 2150 50  0001 C CNN
F 1 "+5V" H 4015 2473 50  0001 C CNN
F 2 "" H 4000 2300 50  0001 C CNN
F 3 "" H 4000 2300 50  0001 C CNN
F 4 "+5V (PSU Red)" H 4015 2473 50  0000 C CNN "Label"
	1    4000 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF6E9C2
P 4200 4750
F 0 "#PWR?" H 4200 4500 50  0001 C CNN
F 1 "GND" H 4205 4577 50  0000 C CNN
F 2 "" H 4200 4750 50  0001 C CNN
F 3 "" H 4200 4750 50  0001 C CNN
	1    4200 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2300 4000 2550
$Comp
L pc-schema-rescue:5V_Two_Channel_Relay_Module-Driver_Relay-pc-schema-rescue-raspberry-schema-rescue-raspberry-schema-rescue U?
U 1 1 5DF8752A
P 7250 3500
F 0 "U?" H 7250 4381 50  0001 C CNN
F 1 "5V_Two_Channel_Relay_Module" H 7250 4290 50  0001 C CNN
F 2 "" H 7650 4000 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/drv8860.pdf" H 7250 3400 50  0001 C CNN
F 4 "Two Channel Relay Module" H 7250 2874 50  0000 C CNN "Label"
	1    7250 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF8BF26
P 7250 4350
F 0 "#PWR?" H 7250 4100 50  0001 C CNN
F 1 "GND" H 7255 4177 50  0000 C CNN
F 2 "" H 7250 4350 50  0001 C CNN
F 3 "" H 7250 4350 50  0001 C CNN
	1    7250 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 4100 7250 4200
$Comp
L power:+5V #PWR?
U 1 1 5DF8E66B
P 7250 2600
F 0 "#PWR?" H 7250 2450 50  0001 C CNN
F 1 "+5V" H 7265 2773 50  0001 C CNN
F 2 "" H 7250 2600 50  0001 C CNN
F 3 "" H 7250 2600 50  0001 C CNN
F 4 "+5VSB (PSU Purple)" H 7265 2773 50  0000 C CNN "Label"
	1    7250 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2800 7250 2750
Wire Wire Line
	6750 3500 6550 3500
Wire Wire Line
	6550 3500 6550 4200
Wire Wire Line
	6550 4200 7250 4200
Connection ~ 7250 4200
Wire Wire Line
	7250 4200 7250 4350
Text GLabel 8400 3600 2    50   Output ~ 0
230V_Screen_Phase
Wire Wire Line
	7750 3600 8400 3600
Text GLabel 8400 3500 2    50   Input ~ 0
230V_Phase
Wire Wire Line
	7750 3500 8400 3500
$Comp
L power:+12V #PWR?
U 1 1 5DF9AFA6
P 8150 2600
F 0 "#PWR?" H 8150 2450 50  0001 C CNN
F 1 "+12V" H 8165 2773 50  0001 C CNN
F 2 "" H 8150 2600 50  0001 C CNN
F 3 "" H 8150 2600 50  0001 C CNN
F 4 "+12V (PSU Yellow)" H 8165 2773 50  0000 C CNN "Label"
	1    8150 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 3200 7750 3200
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5DF9C90E
P 8600 3850
F 0 "J?" H 8680 3842 50  0001 L CNN
F 1 "Conn_01x02" H 8680 3751 50  0001 L CNN
F 2 "" H 8600 3850 50  0001 C CNN
F 3 "~" H 8600 3850 50  0001 C CNN
F 4 "Game Buttons Light (7V)" H 8680 3796 50  0000 L CNN "Label"
	1    8600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 4200 8400 4200
Wire Wire Line
	7750 3300 8150 3300
Wire Wire Line
	8150 3300 8150 3850
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5DF9DA3B
P 8600 4100
F 0 "J?" H 8680 4092 50  0001 L CNN
F 1 "Conn_01x02" H 8680 4001 50  0001 L CNN
F 2 "" H 8600 4100 50  0001 C CNN
F 3 "~" H 8600 4100 50  0001 C CNN
F 4 "Marquee Light (12V)" H 8680 4046 50  0000 L CNN "Label"
	1    8600 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4100 8400 4100
Wire Wire Line
	8400 3850 8150 3850
Connection ~ 8150 3850
Wire Wire Line
	8150 3850 8150 4100
Wire Wire Line
	7250 2750 8000 2750
Connection ~ 7250 2750
Wire Wire Line
	7250 2750 7250 2600
Wire Wire Line
	8150 2600 8150 3200
Wire Wire Line
	8000 3950 8000 2750
Wire Wire Line
	8000 3950 8400 3950
Wire Wire Line
	4200 4550 4200 4750
Text GLabel 2800 4250 0    50   Output ~ 0
PC_Pwr_Btn
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5DFBD53D
P 2600 3650
F 0 "J?" H 2680 3642 50  0001 L CNN
F 1 "Conn_01x02" H 2680 3551 50  0001 L CNN
F 2 "" H 2600 3650 50  0001 C CNN
F 3 "~" H 2600 3650 50  0001 C CNN
F 4 "Front Lighting Button Led" H 2518 3417 50  0000 C CNN "Label"
	1    2600 3650
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5DFBD536
P 2600 4000
F 0 "J?" H 2680 3992 50  0001 C CNN
F 1 "Conn_01x02" H 2680 3901 50  0001 C CNN
F 2 "" H 2600 4000 50  0001 C CNN
F 3 "~" H 2600 4000 50  0001 C CNN
F 4 "Front Power Button Led" H 2518 3767 50  0000 C CNN "Label"
	1    2600 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 4250 3450 4250
Wire Wire Line
	3450 4250 3450 3750
Wire Wire Line
	3450 3750 3600 3750
Wire Wire Line
	3600 3650 3400 3650
Wire Wire Line
	2800 3650 3350 3650
Wire Wire Line
	3350 3650 3350 3350
Wire Wire Line
	3350 3350 3600 3350
Wire Wire Line
	2800 4000 3350 4000
Wire Wire Line
	3350 4000 3350 3650
Connection ~ 3350 3650
Wire Wire Line
	2800 3900 3300 3900
Wire Wire Line
	3300 3900 3300 3550
Wire Wire Line
	3300 3550 3600 3550
Wire Wire Line
	2800 3550 3250 3550
Wire Wire Line
	3250 3550 3250 3450
Wire Wire Line
	3250 3450 3600 3450
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5E0A3B53
P 2600 2600
F 0 "J?" H 2680 2592 50  0001 L CNN
F 1 "Conn_01x02" H 2680 2501 50  0001 L CNN
F 2 "" H 2600 2600 50  0001 C CNN
F 3 "~" H 2600 2600 50  0001 C CNN
F 4 "Front Lighting Button" H 2518 2367 50  0000 C CNN "Label"
	1    2600 2600
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5E0A3B5A
P 2600 2950
F 0 "J?" H 2680 2942 50  0001 C CNN
F 1 "Conn_01x02" H 2680 2851 50  0001 C CNN
F 2 "" H 2600 2950 50  0001 C CNN
F 3 "~" H 2600 2950 50  0001 C CNN
F 4 "Front Power Button" H 2518 2717 50  0000 C CNN "Label"
	1    2600 2950
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0AFEA7
P 2850 3050
F 0 "#PWR?" H 2850 2800 50  0001 C CNN
F 1 "GND" H 2855 2877 50  0000 C CNN
F 2 "" H 2850 3050 50  0001 C CNN
F 3 "" H 2850 3050 50  0001 C CNN
	1    2850 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2950 2850 2950
Wire Wire Line
	2850 2950 2850 3050
Wire Wire Line
	2800 2600 2850 2600
Wire Wire Line
	2850 2600 2850 2950
Connection ~ 2850 2950
Wire Wire Line
	3600 3250 3250 3250
Wire Wire Line
	3250 2850 3250 3250
Wire Wire Line
	2800 2850 3250 2850
Wire Wire Line
	2800 2500 3300 2500
Wire Wire Line
	3300 2500 3300 3150
Wire Wire Line
	3300 3150 3600 3150
Wire Wire Line
	6500 3400 6750 3400
Wire Wire Line
	3400 3650 3400 5100
Text GLabel 2800 4350 0    50   Input ~ 0
PSU_Pwr_Green
Wire Wire Line
	3600 3850 3500 3850
Wire Wire Line
	3500 3850 3500 4350
Wire Wire Line
	3500 4350 2800 4350
Wire Wire Line
	3400 5100 6500 5100
Wire Wire Line
	6500 3400 6500 5100
$EndSCHEMATC
