# This test file was generated from offline assembler source
# by bldhtc.rexx 16 Jan 2016 12:11:11
# Treat as object code.  That is, modifications will be lost.
# assemble and listing files are provided for information only.
*Testcase leapfrog processed 16 Jan 2016 12:11:11 by bldhtc.rexx
sysclear
archmode z
numcpu 2
r    1A0=00000001800000000000000000000200
r    1B0=0000000180000000000000000000026E
r    1D0=0002000180000000FFFFFFFFDEADDEAD
r    200=41000226E30001A80024B20402B04120
r    210=0001AE020006B2220030883000184232
r    220=0050B2B202A0B20402B041000234E300
r    230=01A80024B2050288
r    238=E30002880004E30002B80018E3000288
r    248=0024B2060288EB0002800025E3000280
r    258=0004560002BCE30002800024EB000280
r    268=002FB2B202909202
r    270=01B1D70701B801B81B2247F00212
r    290=01020001800000000000000000000001
r    2A0=00020001800000000000000000000000
r    2B0=00000000000000000000000000000800
runtest 1
*Compare
r 80.2
cpu 0 clocks
cpu 1 clocks
ipending
cr
*Done
