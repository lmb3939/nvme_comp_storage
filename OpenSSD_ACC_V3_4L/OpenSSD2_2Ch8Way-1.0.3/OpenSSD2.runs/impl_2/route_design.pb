
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0452default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0452default:defaultZ17-349h px� 
�
�The version limit for your license is '%s' and will expire in %s days. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
519*common2
2020.012default:default2
-1142default:defaultZ17-1223h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLIO-72default:default2B
.Placement Constraints Check for IO constraints2default:default2�
�An IO Bus FIXED_IO_mio[53:0] with more than one IO standard is found. Components associated with this bus are: HSTL_I_18 (FIXED_IO_mio[27], FIXED_IO_mio[26], FIXED_IO_mio[25], FIXED_IO_mio[24], FIXED_IO_mio[23], FIXED_IO_mio[22], FIXED_IO_mio[21], FIXED_IO_mio[20], FIXED_IO_mio[19], FIXED_IO_mio[18], FIXED_IO_mio[17], FIXED_IO_mio[16]); LVCMOS18 (FIXED_IO_mio[53], FIXED_IO_mio[52], FIXED_IO_mio[51], FIXED_IO_mio[50], FIXED_IO_mio[49], FIXED_IO_mio[48], FIXED_IO_mio[47], FIXED_IO_mio[46], FIXED_IO_mio[45], FIXED_IO_mio[44], FIXED_IO_mio[43], FIXED_IO_mio[42], FIXED_IO_mio[41], FIXED_IO_mio[40], FIXED_IO_mio[39] (the first 15 of 42 listed)); 2default:defaultZ23-20h px� 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 1 Warnings2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
y
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
82default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
B
-Phase 1 Build RT Design | Checksum: d198b224
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:04 ; elapsed = 00:00:46 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8258 ; free virtual = 282952default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px� 
A
,Phase 2.1 Create Timer | Checksum: d198b224
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:05 ; elapsed = 00:00:47 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8255 ; free virtual = 282922default:defaulth px� 
t

Phase %s%s
101*constraints2
2.2 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
F
1Phase 2.2 Pre Route Cleanup | Checksum: d198b224
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:05 ; elapsed = 00:00:48 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8237 ; free virtual = 282752default:defaulth px� 
p

Phase %s%s
101*constraints2
2.3 2default:default2!
Update Timing2default:defaultZ18-101h px� 
C
.Phase 2.3 Update Timing | Checksum: 1c60579d7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:47 ; elapsed = 00:01:00 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8226 ; free virtual = 282642default:defaulth px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=0.102  | TNS=0.000  | WHS=-0.541 | THS=-2666.986|
2default:defaultZ35-416h px� 
I
4Phase 2 Router Initialization | Checksum: 1e2ab2ed7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:08 ; elapsed = 00:01:05 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8225 ; free virtual = 282642default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
C
.Phase 3 Initial Routing | Checksum: 15e98daa2
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:04:21 ; elapsed = 00:01:27 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8227 ; free virtual = 282662default:defaulth px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
4.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
D
/Phase 4.1.1 Update Timing | Checksum: d3682e86
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:06:18 ; elapsed = 00:01:54 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8227 ; free virtual = 282662default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=-0.162 | TNS=-0.462 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
v

Phase %s%s
101*constraints2
4.1.2 2default:default2%
GlobIterForTiming2default:defaultZ18-101h px� 
t

Phase %s%s
101*constraints2
4.1.2.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
G
2Phase 4.1.2.1 Update Timing | Checksum: 18798cbc2
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:06:20 ; elapsed = 00:01:54 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8227 ; free virtual = 282662default:defaulth px� 
u

Phase %s%s
101*constraints2
4.1.2.2 2default:default2"
Fast Budgeting2default:defaultZ18-101h px� 
H
3Phase 4.1.2.2 Fast Budgeting | Checksum: 1a43563ec
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:06:22 ; elapsed = 00:01:57 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8227 ; free virtual = 282652default:defaulth px� 
I
4Phase 4.1.2 GlobIterForTiming | Checksum: 28bb44675
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:06:23 ; elapsed = 00:01:57 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8227 ; free virtual = 282652default:defaulth px� 
H
3Phase 4.1 Global Iteration 0 | Checksum: 28bb44675
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:06:23 ; elapsed = 00:01:57 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8227 ; free virtual = 282652default:defaulth px� 
u

Phase %s%s
101*constraints2
4.2 2default:default2&
Global Iteration 12default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
4.2.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 4.2.1 Update Timing | Checksum: 12c6bf277
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:06:38 ; elapsed = 00:02:03 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8227 ; free virtual = 282662default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=-0.042 | TNS=-0.042 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
v

Phase %s%s
101*constraints2
4.2.2 2default:default2%
GlobIterForTiming2default:defaultZ18-101h px� 
t

Phase %s%s
101*constraints2
4.2.2.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
G
2Phase 4.2.2.1 Update Timing | Checksum: 1ad95cd6a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:06:40 ; elapsed = 00:02:04 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8227 ; free virtual = 282662default:defaulth px� 
u

Phase %s%s
101*constraints2
4.2.2.2 2default:default2"
Fast Budgeting2default:defaultZ18-101h px� 
G
2Phase 4.2.2.2 Fast Budgeting | Checksum: cfda44a8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:06:43 ; elapsed = 00:02:06 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8227 ; free virtual = 282662default:defaulth px� 
I
4Phase 4.2.2 GlobIterForTiming | Checksum: 15f26ba9c
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:06:43 ; elapsed = 00:02:07 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
H
3Phase 4.2 Global Iteration 1 | Checksum: 15f26ba9c
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:06:44 ; elapsed = 00:02:07 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
u

Phase %s%s
101*constraints2
4.3 2default:default2&
Global Iteration 22default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
4.3.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 4.3.1 Update Timing | Checksum: 147492cdb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:00 ; elapsed = 00:02:13 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=-0.059 | TNS=-0.281 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.3 Global Iteration 2 | Checksum: 1d760bfce
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:00 ; elapsed = 00:02:13 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
F
1Phase 4 Rip-up And Reroute | Checksum: 1d760bfce
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:00 ; elapsed = 00:02:13 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 5.1.1 Update Timing | Checksum: 12c947bb5
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:06 ; elapsed = 00:02:15 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=0.088  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
C
.Phase 5.1 Delay CleanUp | Checksum: 12c947bb5
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:07 ; elapsed = 00:02:15 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 12c947bb5
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:07 ; elapsed = 00:02:15 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
O
:Phase 5 Delay and Skew Optimization | Checksum: 12c947bb5
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:07 ; elapsed = 00:02:15 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
C
.Phase 6.1 Update Timing | Checksum: 2047926af
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:15 ; elapsed = 00:02:17 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=0.088  | TNS=0.000  | WHS=0.038  | THS=0.000  |
2default:defaultZ35-416h px� 
A
,Phase 6 Post Hold Fix | Checksum: 17818102a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:15 ; elapsed = 00:02:17 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
B
-Phase 7 Route finalize | Checksum: 20a7c543b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:16 ; elapsed = 00:02:18 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
I
4Phase 8 Verifying routed nets | Checksum: 20a7c543b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:16 ; elapsed = 00:02:18 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8409 ; free virtual = 284482default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
E
0Phase 9 Depositing Routes | Checksum: 14d3e626f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:19 ; elapsed = 00:02:21 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8408 ; free virtual = 284482default:defaulth px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
�
Estimated Timing Summary %s
57*route2J
6| WNS=0.088  | TNS=0.000  | WHS=0.038  | THS=0.000  |
2default:defaultZ35-57h px� 
�
�The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px� 
G
2Phase 10 Post Router Timing | Checksum: 14d3e626f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:19 ; elapsed = 00:02:21 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8408 ; free virtual = 284482default:defaulth px� 
=
Router Completed Successfully
16*routeZ35-16h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:07:19 ; elapsed = 00:02:21 . Memory (MB): peak = 3030.336 ; gain = 0.000 ; free physical = 8408 ; free virtual = 284482default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
612default:default2
772default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
route_design: 2default:default2
00:07:242default:default2
00:02:242default:default2
3030.3362default:default2
0.0002default:default2
84082default:default2
284482default:defaultZ17-722h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:162default:default2
00:00:062default:default2
3030.3362default:default2
0.0002default:default2
83132default:default2
284482default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:00:192default:default2
00:00:092default:default2
3030.3362default:default2
0.0002default:default2
83852default:default2
284482default:defaultZ17-722h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
h/home/giuseppezynq/OpenSSD_ACC_V3_4L/OpenSSD2_2Ch8Way-1.0.3/OpenSSD2.runs/impl_2/OpenSSD2_drc_routed.rpth/home/giuseppezynq/OpenSSD_ACC_V3_4L/OpenSSD2_2Ch8Way-1.0.3/OpenSSD2.runs/impl_2/OpenSSD2_drc_routed.rpt2default:default8Z2-168h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2 
report_drc: 2default:default2
00:00:132default:default2
00:00:052default:default2
3030.3362default:default2
0.0002default:default2
83832default:default2
284462default:defaultZ17-722h px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -2, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
82default:defaultZ38-191h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2+
report_timing_summary: 2default:default2
00:00:392default:default2
00:00:082default:default2
3030.3362default:default2
0.0002default:default2
83792default:default2
284462default:defaultZ17-722h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
report_power: 2default:default2
00:00:152default:default2
00:00:062default:default2
3030.3362default:default2
0.0002default:default2
83792default:default2
284472default:defaultZ17-722h px� 


End Record