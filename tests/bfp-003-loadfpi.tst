*Testcase bfp-003-loadfpi.tst:    CFEBR, CFEBRA, CFDBR, CFDBRA, CFXBR, CFXBRA

#Testcase bfp-003-loadfpi.tst: IEEE Load FP Integer
#..Includes LOAD FP INTEGER (6).  Tests traps, exceptions, results
#..from all rounding modes, and NaN propagation.


sysclear
archmode esame

#
# Following suppresses logging of program checks.  This test program, as part
# of its normal operation, generates 15 program check messages that have
# no value in the validation process.  (The messages, not the program checks.)
#
ostailor quiet

loadcore "$(testpath)/bfp-003-loadfpi.core"

runtest 1.0

ostailor null   # restore messages for subsequent tests


# Short BFP Inputs converted to integer short BFP
*Compare
r 1000.10  
*Want "CFEBR result pairs 1-2" 3F800000 3F800000 C0000000 C0000000
r 1010.10  
*Want "CFEBR result pairs 3-4" 40000000 40000000 7FC10000 00000000
r 1020.10
*Want "CFEBR result pair 5-6"  7FC10000 7FC10000 3F800000 3F800000
r 1030.8
*Want "CFEBR result pair 7"    80000000 80000000

# Inputs converted to BFP Short - FPC
*Compare
r 1080.10
*Want "CFEBR FPC pairs 1-2" 00000000 F8000000 00080000 F8000C00
r 1090.10
*Want "CFEBR FPC pairs 3-4" 00080000 F8000800 00800000 F8008000
r 10A0.10
*Want "CFEBR FPC pair 5-6"  00000000 F8000000 00080000 F8000C00
r 10B0.08
*Want "CFEBR FPC pair 7"    00080000 F8000800


#  rounding mode tests - short BFP - results from rounding
*Compare
r 1100.10  #                            RZ,      RP,      RM,      RFS
*Want "CFEBRA -9.5 FPC modes 1-3, 7"  C1100000 C1100000 C1200000 C1100000
r 1110.10  #                            RNTA,    RFS,     RNTE,    RZ
*Want "CFEBRA -9.5 M3 modes 1, 3-5"   C1200000 C1100000 C1200000 C1100000
r 1120.08  #                            RP,      RM
*Want "CFEBRA -9.5 M3 modes 6, 7"     C1100000 C1200000

r 1130.10  #                            RZ,      RP,      RM,      RFS
*Want "CFEBRA -5.5 FPC modes 1-3, 7"  C0A00000 C0A00000 C0C00000 C0A00000
r 1140.10  #                            RNTA,    RFS,     RNTE,    RZ
*Want "CFEBRA -5.5 M3 modes 1, 3-5"   C0C00000 C0A00000 C0C00000 C0A00000
r 1150.08  #                            RP,      RM
*Want "CFEBRA -5.5 M3 modes 6, 7"     C0A00000 C0C00000

r 1160.10  #                            RZ,      RP,      RM,      RFS
*Want "CFEBRA -2.5 FPC modes 1-3, 7"  C0000000 C0000000 C0400000 C0400000
r 1170.10  #                            RNTA,    RFS,     RNTE,    RZ
*Want "CFEBRA -2.5 M3 modes 1, 3-5"   C0400000 C0400000 C0000000 C0000000
r 1180.08  #                            RP,      RM
*Want "CFEBRA -2.5 M3 modes 6, 7"     C0000000 C0400000

r 1190.10  #                            RZ,      RP,      RM,      RFS
*Want "CFEBRA -1.5 FPC modes 1-3, 7"  BF800000 BF800000 C0000000 BF800000
r 11A0.10  #                            RNTA,    RFS,     RNTE,    RZ
*Want "CFEBRA -1.5 M3 modes 1, 3-5"   C0000000 BF800000 C0000000 BF800000
r 11B0.08  #                            RP,      RM
*Want "CFEBRA -1.5 M3 modes 6, 7"     BF800000 C0000000

r 11C0.10  #                            RZ,      RP,      RM,      RFS
*Want "CFEBRA -0.5 FPC modes 1-3, 7"  80000000 80000000 BF800000 BF800000
r 11D0.10  #                            RNTA,    RFS,     RNTE,    RZ
*Want "CFEBRA -0.5 M3 modes 1, 3-5"   BF800000 BF800000 80000000 80000000
r 11E0.08  #                            RP,      RM
*Want "CFEBRA -0.5 M3 modes 6, 7"     80000000 BF800000

r 11F0.10  #                            RZ,      RP,      RM,      RFS
*Want "CFEBRA 0.5 FPC modes 1-3, 7"   00000000 3F800000 00000000 3F800000
r 1200.10  #                            RNTA,    RFS,     RNTE,    RZ
*Want "CFEBRA 0.5 M3 modes 1, 3-5"    3F800000 3F800000 00000000 00000000
r 1210.08  #                            RP,      RM
*Want "CFEBRA 0.5 M3 modes 6, 7"      3F800000 00000000

r 1220.10  #                            RZ,      RP,      RM,      RFS
*Want "CFEBRA 1.5 FPC modes 1-3, 7"   3F800000 40000000 3F800000 3F800000
r 1230.10  #                            RNTA,    RFS,     RNTE,    RZ
*Want "CFEBRA 1.5 M3 modes 1, 3-5"    40000000 3F800000 40000000 3F800000
r 1240.08  #                            RP,      RM
*Want "CFEBRA 1.5 M3 modes 6, 7"      40000000 3F800000

r 1250.10  #                            RZ,      RP,      RM,      RFS
*Want "CFEBRA 2.5 FPC modes 1-3, 7"   40000000 40400000 40000000 40400000
r 1260.10  #                            RNTA,    RFS,     RNTE,    RZ
*Want "CFEBRA 2.5 M3 modes 1, 3-5"    40400000 40400000 40000000 40000000
r 1270.08  #                            RP,      RM
*Want "CFEBRA 2.5 M3 modes 6, 7"      40400000 40000000

r 1280.10  #                            RZ,      RP,      RM,      RFS
*Want "CFEBRA 5.5 FPC modes 1-3, 7"   40A00000 40C00000 40A00000 40A00000
r 1290.10  #                            RNTA,    RFS,     RNTE,    RZ
*Want "CFEBRA 5.5 M3 modes 1, 3-5"    40C00000 40A00000 40C00000 40A00000
r 12A0.08  #                            RP,      RM
*Want "CFEBRA 5.5 M3 modes 6, 7"      40C00000 40A00000

r 12B0.10  #                            RZ,      RP,      RM,      RFS
*Want "CFEBRA 9.5 FPC modes 1-3, 7"   41100000 41200000 41100000 41100000
r 12C0.10  #                            RNTA,    RFS,     RNTE,    RZ
*Want "CFEBRA 9.5 M3 modes 1, 3-5"    41200000 41100000 41200000 41100000
r 12D0.08  #                            RP,      RM
*Want "CFEBRA 9.5 M3 modes 6, 7"      41200000 41100000

r 12E0.10  #                            RZ,      RP,      RM,      RFS
*Want "CFEBRA +0.75 FPC modes 1-3, 7" 00000000 3F800000 00000000 3F800000
r 12F0.10  #                            RNTA,    RFS,     RNTE,    RZ
*Want "CFEBRA +0.75 M3 modes 1, 3-5"  3F800000 3F800000 3F800000 00000000 
r 1300.08  #                            RP,      RM
*Want "CFEBRA +0.75 M3 modes 6, 7"    3F800000 00000000 

r 1310.10  #                            RZ,      RP,      RM,      RFS
*Want "CFEBRA -0.25 FPC modes 1-3, 7" 80000000 80000000 BF800000 BF800000
r 1320.10  #                            RNTA,    RFS,     RNTE,    RZ
*Want "CFEBRA -0.25 M3 modes 1, 3-5"  80000000 BF800000 80000000 80000000
r 1330.08  #                            RP,      RM
*Want "CFEBRA -0.25 M3 modes 6, 7"    80000000 BF800000

#  rounding mode tests - short BFP - FPCR contents 
*Compare
r 1400.10
*Want "CFEBRA -9.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
r 1410.10
*Want "CFEBRA -9.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 1420.08
*Want "CFEBRA -9.5 M3 modes 5-7 - FCPR"    00080000 00080000

r 1430.10
*Want "CFEBRA -5.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
r 1440.10
*Want "CFEBRA -5.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 1450.08
*Want "CFEBRA -5.5 M3 modes 6, 7 FCPR"     00080000 00080000

r 1460.10
*Want "CFEBRA -2.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
r 1470.10
*Want "CFEBRA -2.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 1480.08
*Want "CFEBRA -2.5 M3 modes 6, 7 FCPR"     00080000 00080000

r 1490.10
*Want "CFEBRA -1.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
r 14A0.10
*Want "CFEBRA -1.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 14B0.08
*Want "CFEBRA -1.5 M3 modes 6, 7 FCPR"     00080000 00080000

r 14C0.10
*Want "CFEBRA -0.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
r 14D0.10
*Want "CFEBRA -0.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 14E0.08
*Want "CFEBRA -0.5 M3 modes 6, 7 FCPR"     00080000 00080000

r 14F0.10
*Want "CFEBRA +0.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
r 1500.10
*Want "CFEBRA +0.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 1510.08
*Want "CFEBRA +0.5 M3 modes 6, 7 FCPR"     00080000 00080000

r 1520.10
*Want "CFEBRA +1.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
r 1530.10
*Want "CFEBRA +1.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 1540.08
*Want "CFEBRA +1.5 M3 modes 6, 7 FCPR"     00080000 00080000

r 1550.10
*Want "CFEBRA +2.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
r 1560.10
*Want "CFEBRA +2.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 1570.08
*Want "CFEBRA +2.5 M3 modes 6, 7 FCPR"     00080000 00080000

r 1580.10
*Want "CFEBRA +5.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
r 1590.10
*Want "CFEBRA +5.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 15A0.08
*Want "CFEBRA +5.5 M3 modes 6, 7 FCPR"     00080000 00080000

r 15B0.10
*Want "CFEBRA +9.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
r 15C0.10
*Want "CFEBRA +9.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 15D0.08
*Want "CFEBRA +9.5 M3 modes 6, 7 FCPR"     00080000 00080000

r 15E0.10
*Want "CFEBRA +0.75 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
r 15F0.10
*Want "CFEBRA +0.75 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 1600.08
*Want "CFEBRA +0.75 M3 modes 6, 7 FCPR"     00080000 00080000

r 1610.10
*Want "CFEBRA -0.25 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
r 1620.10
*Want "CFEBRA -0.25 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 1630.08
*Want "CFEBRA -0.25 M3 modes 6, 7 FCPR"     00080000 00080000


# Results from long BFP rounded to long BFP integer
*Compare
R 2000.10
*Want "CFDBR result pair 1" 3FF00000 00000000 3FF00000 00000000
R 2010.10
*Want "CFDBR result pair 2" C0000000 00000000 C0000000 00000000
R 2020.10
*Want "CFDBR result pair 3" 40000000 00000000 40000000 00000000
R 2030.10
*Want "CFDBR result pair 4" 7FF81000 00000000 00000000 00000000
R 2040.10
*Want "CFDBR result pair 5" 7FF81000 00000000 7FF81000 00000000
R 2050.10
*Want "CFDBR result pair 6" 3FF00000 00000000 3FF00000 00000000
R 2060.10
*Want "CFDBR result pair 7" 80000000 00000000 80000000 00000000

# Results from long BFP rounded to long BFP integer - FPCR
*Compare
R 2100.10
*Want "CFDBR FPC pairs 1-2" 00000000 F8000000 00080000 F8000C00
R 2110.10
*Want "CFDBR FPC pairs 3-4" 00080000 F8000800 00800000 F8008000
R 2120.10
*Want "CFDBR FPC pairs 5-6" 00000000 F8000000 00080000 F8000C00
R 2130.08
*Want "CFDBR FPC pair 7"    00080000 F8000800


#  rounding mode tests - long BFP - results from rounding
*Compare
R 2200.10  #                            RZ,               RP
*Want "CFDBRA -9.5 FPC modes 1, 2"   C0220000 00000000 C0220000 00000000
R 2210.10  #                            RM,               RFS
*Want "CFDBRA -9.5 FPC modes 3, 7"   C0240000 00000000 C0220000 00000000
R 2220.10  #                           RNTA,              RFS
*Want "CFDBRA -9.5 M3 modes 1, 3"    C0240000 00000000 C0220000 00000000
R 2230.10  #                           RNTE,              RZ
*Want "CFDBRA -9.5 M3 modes 4, 5"    C0240000 00000000 C0220000 00000000
R 2240.10  #                           RP,                RM
*Want "CFDBRA -9.5 M3 modes 6, 7"    C0220000 00000000 C0240000 00000000

R 2250.10  #                            RZ,               RP
*Want "CFDBRA -5.5 FPC modes 1, 2"   C0140000 00000000 C0140000 00000000
R 2260.10  #                            RM,               RFS
*Want "CFDBRA -5.5 FPC modes 3, 7"   C0180000 00000000 C0140000 00000000
R 2270.10  #                            RNTA,             RFS
*Want "CFDBRA -5.5 M3 modes 1, 3"    C0180000 00000000 C0140000 00000000
R 2280.10  #                            RNTE,             RZ
*Want "CFDBRA -5.5 M3 modes 4, 5"    C0180000 00000000 C0140000 00000000
R 2290.10  #                            RP,               RM
*Want "CFDBRA -5.5 M3 modes 6, 7"    C0140000 00000000 C0180000 00000000

R 22A0.10  #                            RZ,               RP
*Want "CFDBRA -2.5 FPC modes 1, 2"   C0000000 00000000 C0000000 00000000
R 22B0.10  #                            RM,               RFS
*Want "CFDBRA -2.5 FPC modes 3, 7"   C0080000 00000000 C0080000 00000000
R 22C0.10  #                            RNTA,             RFS
*Want "CFDBRA -2.5 M3 modes 1, 3"    C0080000 00000000 C0080000 00000000
R 22D0.10  #                            RNTE,             RZ
*Want "CFDBRA -2.5 M3 modes 4, 5"    C0000000 00000000 C0000000 00000000
R 22E0.10  #                            RP,               RM
*Want "CFDBRA -2.5 M3 modes 6, 7"    C0000000 00000000 C0080000 00000000

R 22F0.10  #                            RZ,               RP
*Want "CFDBRA -1.5 FPC modes 1, 2"   BFF00000 00000000 BFF00000 00000000
R 2300.10  #                            RM,               RFS
*Want "CFDBRA -1.5 FPC modes 3, 7"   C0000000 00000000 BFF00000 00000000
R 2310.10  #                            RNTA,             RFS
*Want "CFDBRA -1.5 M3 modes 1, 3"    C0000000 00000000 BFF00000 00000000
R 2320.10  #                            RNTE,             RZ
*Want "CFDBRA -1.5 M3 modes 4, 5"    C0000000 00000000 BFF00000 00000000
R 2330.10  #                            RP,               RM
*Want "CFDBRA -1.5 M3 modes 6, 7"    BFF00000 00000000 C0000000 00000000

R 2340.10  #                            RZ,              RP
*Want "CFDBRA -0.5 FPC modes 1, 2"   80000000 00000000 80000000 00000000
R 2350.10  #                            RM,              RFS
*Want "CFDBRA -0.5 FPC modes 3, 7"   BFF00000 00000000 BFF00000 00000000
R 2360.10  #                            RNTA,            RFS
*Want "CFDBRA -0.5 M3 modes 1, 3"    BFF00000 00000000 BFF00000 00000000
R 2370.10  #                            RNTE,             RZ
*Want "CFDBRA -0.5 M3 modes 4, 5"    80000000 00000000 80000000 00000000
R 2380.10  #                            RP,               RM
*Want "CFDBRA -0.5 M3 modes 6, 7"    80000000 00000000 BFF00000 00000000

R 2390.10  #                            RZ,               RP
*Want "CFDBRA 0.5 FPC modes 1, 2"    00000000 00000000 3FF00000 00000000
R 23A0.10  #                            RM,               RFS
*Want "CFDBRA 0.5 FPC modes 3, 7"    00000000 00000000 3FF00000 00000000
R 23B0.10  #                            RNTA,             RFS
*Want "CFDBRA 0.5 M3 modes 1, 3"     3FF00000 00000000 3FF00000 00000000
R 23C0.10  #                            RNTE,             RZ
*Want "CFDBRA 0.5 M3 modes 4, 5"     00000000 00000000 00000000 00000000
R 23D0.10  #                            RP,               RM
*Want "CFDBRA 0.5 M3 modes 6, 7"     3FF00000 00000000 00000000 00000000

R 23E0.10  #                            RZ,               RP
*Want "CFDBRA 1.5 FPC modes 1, 2"    3FF00000 00000000 40000000 00000000
R 23F0.10  #                            RM,               RFS
*Want "CFDBRA 1.5 FPC modes 3, 7"    3FF00000 00000000 3FF00000 00000000
R 2400.10  #                            RNTA,             RFS
*Want "CFDBRA 1.5 M3 modes 1, 3"     40000000 00000000 3FF00000 00000000
R 2410.10  #                            RNTE,             RZ
*Want "CFDBRA 1.5 M3 modes 4, 5"     40000000 00000000 3FF00000 00000000
R 2420.10  #                            RP,               RM
*Want "CFDBRA 1.5 M3 modes 6, 7"     40000000 00000000 3FF00000 00000000

R 2430.10  #                            RZ,               RP
*Want "CFDBRA 2.5 FPC modes 1, 2"    40000000 00000000 40080000 00000000
R 2440.10  #                            RM,               RFS
*Want "CFDBRA 2.5 FPC modes 3, 7"    40000000 00000000 40080000 00000000
R 2450.10  #                            RNTA,             RFS
*Want "CFDBRA 2.5 M3 modes 1, 3"     40080000 00000000 40080000 00000000
R 2460.10  #                            RNTE,             RZ
*Want "CFDBRA 2.5 M3 modes 4, 5"     40000000 00000000 40000000 00000000
R 2470.10  #                            RP,               RM
*Want "CFDBRA 2.5 M3 modes 6, 7"     40080000 00000000 40000000 00000000

R 2480.10  #                            RZ,               RP
*Want "CFDBRA 5.5 FPC modes 1, 2"    40140000 00000000 40180000 00000000
R 2490.10  #                            RM,               RFS
*Want "CFDBRA 5.5 FPC modes 3, 7"    40140000 00000000 40140000 00000000
R 24A0.10  #                            RNTA,             RFS
*Want "CFDBRA 5.5 M3 modes 1, 3"     40180000 00000000 40140000 00000000
R 24B0.10  #                            RNTE,             RZ
*Want "CFDBRA 5.5 M3 modes 4, 5"     40180000 00000000 40140000 00000000
R 24C0.10  #                            RP,               RM
*Want "CFDBRA 5.5 M3 modes 6, 7"     40180000 00000000 40140000 00000000

R 24D0.10  #                            RZ,               RP
*Want "CFDBRA 9.5 FPC modes 1, 2"    40220000 00000000 40240000 00000000
R 24E0.10  #                            RM,               RFS
*Want "CFDBRA 9.5 FPC modes 3, 7"    40220000 00000000 40220000 00000000
R 24F0.10  #                            RNTA,             RFS
*Want "CFDBRA 9.5 M3 modes 1, 3"     40240000 00000000 40220000 00000000
R 2500.10  #                            RNTE,             RZ
*Want "CFDBRA 9.5 M3 modes 4, 5"     40240000 00000000 40220000 00000000
R 2510.10  #                            RP,               RM
*Want "CFDBRA 9.5 M3 modes 6, 7"     40240000 00000000 40220000 00000000

R 2520.10  #                            RZ,               RP
*Want "CFDBRA +0.75 FPC modes 1, 2"    00000000 00000000 3FF00000 00000000
R 2530.10  #                            RM,               RFS
*Want "CFDBRA +0.75 FPC modes 3, 7"    00000000 00000000 3FF00000 00000000
R 2540.10  #                            RNTA,             RFS
*Want "CFDBRA +0.75 M3 modes 1, 3"     3FF00000 00000000 3FF00000 00000000
R 2550.10  #                            RNTE,             RZ
*Want "CFDBRA +0.75 M3 modes 4, 5"     3FF00000 00000000 00000000 00000000
R 2560.10  #                            RP,               RM
*Want "CFDBRA +0.75 M3 modes 6, 7"     3FF00000 00000000 00000000 00000000

R 2570.10  #                            RZ,               RP
*Want "CFDBRA -0.25 FPC modes 1, 2"    80000000 00000000 80000000 00000000
R 2580.10  #                            RM,               RFS
*Want "CFDBRA -0.25 FPC modes 3, 7"    BFF00000 00000000 BFF00000 00000000
R 2590.10  #                            RNTA,             RFS
*Want "CFDBRA -0.25 M3 modes 1, 3"     80000000 00000000 BFF00000 00000000
R 25A0.10  #                            RNTE,             RZ
*Want "CFDBRA -0.25 M3 modes 4, 5"     80000000 00000000 80000000 00000000
R 25B0.10  #                            RP,               RM
*Want "CFDBRA -0.25 M3 modes 6, 7"     80000000 00000000 BFF00000 00000000


#  rounding mode tests - long BFP - FPCR contents with cc in last byte
*Compare
R 2800.10
*Want "CFDBRA -9.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 2810.10
*Want "CFDBRA -9.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 2820.08
*Want "CFDBRA -9.5 M3 modes 6, 7 FCPR"     00080000 00080000

R 2830.10
*Want "CFDBRA -5.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 2840.10
*Want "CFDBRA -5.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 2850.08
*Want "CFDBRA -5.5 M3 modes 6, 7 FCPR"     00080000 00080000

R 2860.10
*Want "CFDBRA -2.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 2870.10
*Want "CFDBRA -2.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 2880.08
*Want "CFDBRA -2.5 M3 modes 6, 7 FCPR"     00080000 00080000

R 2890.10
*Want "CFDBRA -1.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 28A0.10
*Want "CFDBRA -1.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 28B0.08
*Want "CFDBRA -1.5 M3 modes 6, 7 FCPR"     00080000 00080000

R 28C0.10
*Want "CFDBRA -0.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 28D0.10
*Want "CFDBRA -0.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 28E0.08
*Want "CFDBRA -0.5 M3 modes 6, 7 FCPR"     00080000 00080000

R 28F0.10
*Want "CFDBRA +0.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 2900.10
*Want "CFDBRA +0.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 2910.08
*Want "CFDBRA +0.5 M3 modes 6, 7 FCPR"     00080000 00080000

R 2920.10
*Want "CFDBRA +1.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 2930.10
*Want "CFDBRA +1.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 2940.08
*Want "CFDBRA +1.5 M3 modes 6, 7 FCPR"     00080000 00080000

R 2950.10
*Want "CFDBRA +2.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 2960.10
*Want "CFDBRA +2.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 2970.08
*Want "CFDBRA +2.5 M3 modes 6, 7 FCPR"     00080000 00080000

R 2980.10
*Want "CFDBRA +5.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 2990.10
*Want "CFDBRA +5.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 29A0.08
*Want "CFDBRA +5.5 M3 modes 6, 7 FCPR"     00080000 00080000

R 29B0.10
*Want "CFDBRA +9.5 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 29C0.10
*Want "CFDBRA +9.5 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 29D0.08
*Want "CFDBRA +9.5 M3 modes 6, 7 FCPR"     00080000 00080000

R 29E0.10
*Want "CFDBRA +0.75 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 29F0.10
*Want "CFDBRA +0.75 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 2A00.08
*Want "CFDBRA +0.75 M3 modes 6, 7 FCPR"     00080000 00080000

R 2A10.10
*Want "CFDBRA -0.25 FPC modes 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 2A20.10
*Want "CFDBRA -0.25 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 2A30.08
*Want "CFDBRA -0.25 M3 modes 6, 7 FCPR"     00080000 00080000


# Results from extended BFP rounded to extended BFP integer
*Compare
r 3000.10
*Want "CFXBR result pair 1a" 3FFF0000 00000000 00000000 00000000
r 3010.10
*Want "CFXBR result pair 1b" 3FFF0000 00000000 00000000 00000000
r 3020.10
*Want "CFXBR result pair 2a" C0000000 00000000 00000000 00000000
r 3030.10
*Want "CFXBR result pair 2b" C0000000 00000000 00000000 00000000
r 3040.10
*Want "CFXBR result pair 3a" 40000000 00000000 00000000 00000000
r 3050.10
*Want "CFXBR result pair 3b" 40000000 00000000 00000000 00000000
r 3060.10
*Want "CFXBR result pair 4a" 7FFF8100 00000000 00000000 00000000
r 3070.10
*Want "CFXBR result pair 4b" 00000000 00000000 00000000 00000000
r 3080.10
*Want "CFXBR result pair 5a" 7FFF8100 00000000 00000000 00000000
r 3090.10
*Want "CFXBR result pair 5b" 7FFF8100 00000000 00000000 00000000
r 30A0.10
*Want "CFXBR result pair 6a" 3FFF0000 00000000 00000000 00000000
r 30B0.10
*Want "CFXBR result pair 6b" 3FFF0000 00000000 00000000 00000000
r 30C0.10
*Want "CFXBR result pair 7a" 80000000 00000000 00000000 00000000
r 30D0.10
*Want "CFXBR result pair 7b" 80000000 00000000 00000000 00000000

# Results from extended BFP rounded to extended BFP integer - FPC
*Compare
r 3200.10
*Want "CFXBR FPC pairs 1-2" 00000000 F8000000 00080000 F8000C00
r 3210.10
*Want "CFXBR FPC pairs 3-4" 00080000 F8000800 00800000 F8008000
r 3220.10
*Want "CFXBR FPC pairs 5-6" 00000000 F8000000 00080000 F8000C00
r 3230.08
*Want "CFXBR FPC pair 7"    00080000 F8000800


#  rounding mode tests - extended BFP - results from rounding
*Compare
R 3300.10  #                     RZ
*Want "CFXBRA -9.5 FPC mode 1" C0022000 00000000 00000000 00000000
R 3310.10  #                     RP
*Want "CFXBRA -9.5 FPC mode 2" C0022000 00000000 00000000 00000000
R 3320.10  #                     RM
*Want "CFXBRA -9.5 FPC mode 3" C0024000 00000000 00000000 00000000
R 3330.10  #                     RFS
*Want "CFXBRA -9.5 FPC mode 7" C0022000 00000000 00000000 00000000
R 3340.10  #                     RP
*Want "CFXBRA -9.5 M3 mode 1"  C0024000 00000000 00000000 00000000
R 3350.10  #                     RP
*Want "CFXBRA -9.5 M3 mode 3"  C0022000 00000000 00000000 00000000
R 3360.10  #                     RM
*Want "CFXBRA -9.5 M3 mode 4"  C0024000 00000000 00000000 00000000
R 3370.10  #                     RFS
*Want "CFXBRA -9.5 M3 mode 5"  C0022000 00000000 00000000 00000000
R 3380.10  #                     RP
*Want "CFXBRA -9.5 M3 mode 6"  C0022000 00000000 00000000 00000000
R 3390.10  #                     RM
*Want "CFXBRA -9.5 M3 mode 7"  C0024000 00000000 00000000 00000000

R 33A0.10  #                     RZ
*Want "CFXBRA -5.5 FPC mode 1" C0014000 00000000 00000000 00000000
R 33B0.10  #                     RP
*Want "CFXBRA -5.5 FPC mode 2" C0014000 00000000 00000000 00000000
R 33C0.10  #                     RM
*Want "CFXBRA -5.5 FPC mode 3" C0018000 00000000 00000000 00000000
R 33D0.10  #                     RFS
*Want "CFXBRA -5.5 FPC mode 7" C0014000 00000000 00000000 00000000
R 33E0.10  #                     RNTA
*Want "CFXBRA -5.5 M3 mode 1"  C0018000 00000000 00000000 00000000
R 33F0.10  #                     RFS
*Want "CFXBRA -5.5 M3 mode 3"  C0014000 00000000 00000000 00000000
R 3400.10  #                     RNTE
*Want "CFXBRA -5.5 M3 mode 4"  C0018000 00000000 00000000 00000000
R 3410.10  #                     RZ
*Want "CFXBRA -5.5 M3 mode 5"  C0014000 00000000 00000000 00000000
R 3420.10  #                     RP
*Want "CFXBRA -5.5 M3 mode 6"  C0014000 00000000 00000000 00000000
R 3430.10  #                     RM
*Want "CFXBRA -5.5 M3 mode 7"  C0018000 00000000 00000000 00000000

R 3440.10  #                     RZ
*Want "CFXBRA -2.5 FPC mode 1" C0000000 00000000 00000000 00000000
R 3450.10  #                     RP
*Want "CFXBRA -2.5 FPC mode 2" C0000000 00000000 00000000 00000000
R 3460.10  #                     RM
*Want "CFXBRA -2.5 FPC mode 3" C0008000 00000000 00000000 00000000
R 3470.10  #                     RFS
*Want "CFXBRA -2.5 FPC mode 7" C0008000 00000000 00000000 00000000
R 3480.10  #                     RNTA
*Want "CFXBRA -2.5 M3 mode 1"  C0008000 00000000 00000000 00000000
R 3490.10  #                     RFS
*Want "CFXBRA -2.5 M3 mode 3"  C0008000 00000000 00000000 00000000
R 34A0.10  #                     RNTE
*Want "CFXBRA -2.5 M3 mode 4"  C0000000 00000000 00000000 00000000
R 34B0.10  #                     RZ
*Want "CFXBRA -2.5 M3 mode 5"  C0000000 00000000 00000000 00000000
R 34C0.10  #                     RP
*Want "CFXBRA -2.5 M3 mode 6"  C0000000 00000000 00000000 00000000
R 34D0.10  #                     RM
*Want "CFXBRA -2.5 M3 mode 7"  C0008000 00000000 00000000 00000000

R 34E0.10  #                     RZ
*Want "CFXBRA -1.5 FPC mode 1" BFFF0000 00000000 00000000 00000000
R 34F0.10  #                     RP
*Want "CFXBRA -1.5 FPC mode 2" BFFF0000 00000000 00000000 00000000
R 3500.10  #                     RM
*Want "CFXBRA -1.5 FPC mode 3" C0000000 00000000 00000000 00000000
R 3510.10  #                     RFS
*Want "CFXBRA -1.5 FPC mode 7" BFFF0000 00000000 00000000 00000000
R 3520.10  #                     RNTA
*Want "CFXBRA -1.5 M3 mode 1"  C0000000 00000000 00000000 00000000
R 3530.10  #                     RFS
*Want "CFXBRA -1.5 M3 mode 3"  BFFF0000 00000000 00000000 00000000
R 3540.10  #                     RNTE
*Want "CFXBRA -1.5 M3 mode 4"  C0000000 00000000 00000000 00000000
R 3550.10  #                     RZ
*Want "CFXBRA -1.5 M3 mode 5"  BFFF0000 00000000 00000000 00000000
R 3560.10  #                     RP
*Want "CFXBRA -1.5 M3 mode 6"  BFFF0000 00000000 00000000 00000000
R 3570.10  #                     RM
*Want "CFXBRA -1.5 M3 mode 7"  C0000000 00000000 00000000 00000000

R 3580.10  #                     RZ
*Want "CFXBRA -0.5 FPC mode 1" 80000000 00000000 00000000 00000000
R 3590.10  #                     RP
*Want "CFXBRA -0.5 FPC mode 2" 80000000 00000000 00000000 00000000
R 35A0.10  #                     RM
*Want "CFXBRA -0.5 FPC mode 3" BFFF0000 00000000 00000000 00000000
R 35B0.10  #                     RFS
*Want "CFXBRA -0.5 FPC mode 7" BFFF0000 00000000 00000000 00000000
R 35C0.10  #                     RNTA
*Want "CFXBRA -0.5 M3 mode 1"  BFFF0000 00000000 00000000 00000000
R 35D0.10  #                     RFS
*Want "CFXBRA -0.5 M3 mode 3"  BFFF0000 00000000 00000000 00000000
R 35E0.10  #                     RNTE
*Want "CFXBRA -0.5 M3 mode 4"  80000000 00000000 00000000 00000000
R 35F0.10  #                     RZ
*Want "CFXBRA -0.5 M3 mode 5"  80000000 00000000 00000000 00000000
R 3600.10  #                     RP
*Want "CFXBRA -0.5 M3 mode 6"  80000000 00000000 00000000 00000000
R 3610.10  #                     RM
*Want "CFXBRA -0.5 M3 mode 7"  BFFF0000 00000000 00000000 00000000

R 3620.10  #                     RZ
*Want "CFXBRA 0.5 FPC mode 1"  00000000 00000000 00000000 00000000
R 3630.10  #                     RP
*Want "CFXBRA 0.5 FPC mode 2"  3FFF0000 00000000 00000000 00000000
R 3640.10  #                     RM
*Want "CFXBRA 0.5 FPC mode 3"  00000000 00000000 00000000 00000000
R 3650.10  #                     RFS
*Want "CFXBRA 0.5 FPC mode 7"  3FFF0000 00000000 00000000 00000000
R 3660.10  #                     RNTA
*Want "CFXBRA 0.5 M3 mode 1"   3FFF0000 00000000 00000000 00000000
R 3670.10  #                     RFS
*Want "CFXBRA 0.5 M3 mode 3"   3FFF0000 00000000 00000000 00000000
R 3680.10  #                     RNTE
*Want "CFXBRA 0.5 M3 mode 4"   00000000 00000000 00000000 00000000
R 3690.10  #                     RZ
*Want "CFXBRA 0.5 M3 mode 5"   00000000 00000000 00000000 00000000
R 36A0.10  #                     RP
*Want "CFXBRA 0.5 M3 mode 6"   3FFF0000 00000000 00000000 00000000
R 36B0.10  #                     RM
*Want "CFXBRA 0.5 M3 mode 7"   00000000 00000000 00000000 00000000

R 36C0.10  #                     RZ
*Want "CFXBRA 1.5 FPC mode 1"  3FFF0000 00000000 00000000 00000000
R 36D0.10  #                     RP
*Want "CFXBRA 1.5 FPC mode 2"  40000000 00000000 00000000 00000000
R 36E0.10  #                     RM
*Want "CFXBRA 1.5 FPC mode 3"  3FFF0000 00000000 00000000 00000000
R 36F0.10  #                     RFS
*Want "CFXBRA 1.5 FPC mode 7"  3FFF0000 00000000 00000000 00000000
R 3700.10  #                     RNTA
*Want "CFXBRA 1.5 M3 mode 1"   40000000 00000000 00000000 00000000
R 3710.10  #                     RFS
*Want "CFXBRA 1.5 M3 mode 3"   3FFF0000 00000000 00000000 00000000
R 3720.10  #                     RNTE
*Want "CFXBRA 1.5 M3 mode 4"   40000000 00000000 00000000 00000000
R 3730.10  #                     RZ
*Want "CFXBRA 1.5 M3 mode 5"   3FFF0000 00000000 00000000 00000000
R 3740.10  #                     RP
*Want "CFXBRA 1.5 M3 mode 6"   40000000 00000000 00000000 00000000
R 3750.10  #                     RM
*Want "CFXBRA 1.5 M3 mode 7"   3FFF0000 00000000 00000000 00000000

R 3760.10  #                     RZ
*Want "CFXBRA 2.5 FPC mode 1"  40000000 00000000 00000000 00000000
R 3770.10  #                     RP
*Want "CFXBRA 2.5 FPC mode 2"  40008000 00000000 00000000 00000000
R 3780.10  #                     RM
*Want "CFXBRA 2.5 FPC mode 3"  40000000 00000000 00000000 00000000
R 3790.10  #                     RFS
*Want "CFXBRA 2.5 FPC mode 7"  40008000 00000000 00000000 00000000
R 37A0.10  #                     RNTA
*Want "CFXBRA 2.5 M3 mode 1"   40008000 00000000 00000000 00000000
R 37B0.10  #                     RFS
*Want "CFXBRA 2.5 M3 mode  3"  40008000 00000000 00000000 00000000
R 37C0.10  #                     RNTE
*Want "CFXBRA 2.5 M3 mode 4"   40000000 00000000 00000000 00000000
R 37D0.10  #                     RZ
*Want "CFXBRA 2.5 M3 mode 5"   40000000 00000000 00000000 00000000
R 37E0.10  #                     RP
*Want "CFXBRA 2.5 M3 mode 6"   40008000 00000000 00000000 00000000
R 37F0.10  #                     RM
*Want "CFXBRA 2.5 M3 mode 7"   40000000 00000000 00000000 00000000

R 3800.10  #                     RZ
*Want "CFXBRA 5.5 FPC mode 1"  40014000 00000000 00000000 00000000
R 3810.10  #                     RP
*Want "CFXBRA 5.5 FPC mode 2"  40018000 00000000 00000000 00000000
R 3820.10  #                     RM
*Want "CFXBRA 5.5 FPC mode 3"  40014000 00000000 00000000 00000000
R 3830.10  #                     RFS
*Want "CFXBRA 5.5 FPC mode 7"  40014000 00000000 00000000 00000000
R 3840.10  #                     RNTA
*Want "CFXBRA 5.5 M3 mode 1"   40018000 00000000 00000000 00000000
R 3850.10  #                     RFS
*Want "CFXBRA 5.5 M3 mode 3"   40014000 00000000 00000000 00000000
R 3860.10  #                     RNTE
*Want "CFXBRA 5.5 M3 mode 4"   40018000 00000000 00000000 00000000
R 3870.10  #                     RZ
*Want "CFXBRA 5.5 M3 mode 5"   40014000 00000000 00000000 00000000
R 3880.10  #                     RP
*Want "CFXBRA 5.5 M3 mode 6"   40018000 00000000 00000000 00000000
R 3890.10  #                     RM
*Want "CFXBRA 5.5 M3 mode 7"   40014000 00000000 00000000 00000000

R 38A0.10  #                    RZ
*Want "CFXBRA 9.5 FPC mode 1" 40022000 00000000 00000000 00000000
R 38B0.10  #                    RP
*Want "CFXBRA 9.5 FPC mode 2" 40024000 00000000 00000000 00000000
R 38C0.10  #                    RM
*Want "CFXBRA 9.5 FPC mode 3" 40022000 00000000 00000000 00000000
R 38D0.10  #                    RFS
*Want "CFXBRA 9.5 FPC mode 7" 40022000 00000000 00000000 00000000
R 38E0.10  #                    RNTA
*Want "CFXBRA 9.5 M3 mode 1"  40024000 00000000 00000000 00000000
R 38F0.10  #                   RFS
*Want "CFXBRA 9.5 M3 mode 3"  40022000 00000000 00000000 00000000
R 3900.10  #                   RNTE
*Want "CFXBRA 9.5 M3 mode 4"  40024000 00000000 00000000 00000000
R 3910.10  #                   RZ
*Want "CFXBRA 9.5 M3 mode 5"  40022000 00000000 00000000 00000000
R 3920.10  #                   RP
*Want "CFXBRA 9.5 M3 mode 6"  40024000 00000000 00000000 00000000
R 3930.10  #                   RM
*Want "CFXBRA 9.5 M3 mode 7"  40022000 00000000 00000000 00000000

r 3940.10  #                      RZ
*Want "CFXBRA +0.75 FPC mode 1" 00000000 00000000 00000000 00000000
r 3950.10  #                      RP
*Want "CFXBRA +0.75 FPC mode 2" 3FFF0000 00000000 00000000 00000000
r 3960.10  #                      RM
*Want "CFXBRA +0.75 FPC mode 3" 00000000 00000000 00000000 00000000
r 3970.10  #                      RFS
*Want "CFXBRA +0.75 FPC mode 7" 3FFF0000 00000000 00000000 00000000
r 3980.10  #                      RNTA
*Want "CFXBRA +0.75 M3 mode 1"  3FFF0000 00000000 00000000 00000000
r 3990.10  #                      RFS
*Want "CFXBRA +0.75 M3 mode 3"  3FFF0000 00000000 00000000 00000000
R 39A0.10  #                      RNTE
*Want "CFXBRA +0.75 M3 mode 4"  3FFF0000 00000000 00000000 00000000
R 39B0.10  #                      RZ
*Want "CFXBRA +0.75 M3 mode 5"  00000000 00000000 00000000 00000000
R 39C0.10  #                      RP
*Want "CFXBRA +0.75 M3 mode 6"  3FFF0000 00000000 00000000 00000000
R 39D0.10  #                      RM
*Want "CFXBRA +0.75 M3 mode 7"  00000000 00000000 00000000 00000000

r 39E0.10  #                      RZ
*Want "CFXBRA -0.25 FPC mode 1" 80000000 00000000 00000000 00000000
r 39F0.10  #                      RP
*Want "CFXBRA -0.25 FPC mode 2" 80000000 00000000 00000000 00000000
r 3A00.10  #                      RM
*Want "CFXBRA -0.25 FPC mode 3" BFFF0000 00000000 00000000 00000000
r 3A10.10  #                      RFS
*Want "CFXBRA -0.25 FPC mode 7" BFFF0000 00000000 00000000 00000000
r 3A20.10  #                      RNTA
*Want "CFXBRA -0.25 M3 mode 1"  80000000 00000000 00000000 00000000
r 3A30.10  #                      RFS
*Want "CFXBRA -0.25 M3 mode 3"  BFFF0000 00000000 00000000 00000000
r 3A40.10  #                      RNTE
*Want "CFXBRA -0.25 M3 mode 4"  80000000 00000000 00000000 00000000
r 3A50.10  #                      RZ
*Want "CFXBRA -0.25 M3 mode 5"  80000000 00000000 00000000 00000000
r 3A60.10  #                      RP
*Want "CFXBRA -0.25 M3 mode 6"  80000000 00000000 00000000 00000000
r 3A70.10  #                      RM
*Want "CFXBRA -0.25 M3 mode 7"  BFFF0000 00000000 00000000 00000000


#  rounding mode tests - extended BFP - FPCR contents with cc in last byte
*Compare
R 3F00.10
*Want "CFXBRA -9.5 FPC mode 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 3F10.10
*Want "CFXBRA -9.5 M3 mode 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 3F20.08
*Want "CFXBRA -9.5 M3 mode 6, 7 FCPR"     00080000 00080000

R 3F30.10
*Want "CFXBRA -5.5 FPC mode 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 3F40.10
*Want "CFXBRA -5.5 M3 mode 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 3F50.08
*Want "CFXBRA -5.5 M3 mode 6, 7 FCPR"     00080000 00080000

R 3F60.10
*Want "CFXBRA -2.5 FPC mode 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 3F70.10
*Want "CFXBRA -2.5 M3 mode 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 3F80.08
*Want "CFXBRA -2.5 M3 mode 6, 7 FCPR"     00080000 00080000

R 3F90.10
*Want "CFXBRA -1.5 FPC mode 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 3FA0.10
*Want "CFXBRA -1.5 M3 mode 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 3FB0.08
*Want "CFXBRA -1.5 M3 mode 6, 7 FCPR"     00080000 00080000

R 3FC0.10
*Want "CFXBRA -0.5 FPC mode 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 3FD0.10
*Want "CFXBRA -0.5 M3 mode 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 3FE0.08
*Want "CFXBRA -0.5 M3 mode 6, 7 FCPR"     00080000 00080000

R 3FF0.10
*Want "CFXBRA +0.5 FPC mode 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 4000.10
*Want "CFXBRA +0.5 M3 mode 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 4010.08
*Want "CFXBRA +0.5 M3 mode 6, 7 FCPR"     00080000 00080000

R 4020.10
*Want "CFXBRA +1.5 FPC mode 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 4030.10
*Want "CFXBRA +1.5 M3 mode 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 4040.08
*Want "CFXBRA +1.5 M3 mode 6, 7 FCPR"     00080000 00080000

R 4050.10
*Want "CFXBRA +2.5 FPC mode 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 4060.10
*Want "CFXBRA +2.5 M3 mode 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 4070.08
*Want "CFXBRA +2.5 M3 mode 6, 7 FCPR"     00080000 00080000

R 4080.10
*Want "CFXBRA +5.5 FPC mode 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 4090.10
*Want "CFXBRA +5.5 M3 mode 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 40A0.08
*Want "CFXBRA +5.5 M3 mode 6, 7 FCPR"     00080000 00080000

R 40B0.10
*Want "CFXBRA +9.5 FPC mode 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 40C0.10
*Want "CFXBRA +9.5 M3 mode 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 40D0.08
*Want "CFXBRA +9.5 M3 mode 6, 7 FCPR"     00080000 00080000

R 40E0.10
*Want "CFXBRA +0.75 FPC mode 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 40F0.10
*Want "CFXBRA +0.75 M3 mode 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 4100.08
*Want "CFXBRA +0.75 M3 mode 6, 7 FCPR"     00080000 00080000

R 4110.10
*Want "CFXBRA -0.25 FPC mode 1-3, 7 FCPR"  00000001 00000002 00000003 00000007
R 4120.10
*Want "CFXBRA -0.25 M3 mode 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
R 4130.08
*Want "CFXBRA -0.25 M3 mode 6, 7 FCPR"     00080000 00080000


*Done

