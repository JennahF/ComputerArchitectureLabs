
r
Command: %s
53*	vivadotcl2A
-synth_design -top cache -part xc7k70tfbv676-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7k70t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7k70t2default:defaultZ17-349h px? 
?
%s*synth2?
rStarting Synthesize : Time (s): cpu = 00:00:03 ; elapsed = 00:00:04 . Memory (MB): peak = 356.445 ; gain = 99.207
2default:defaulth px? 
?
synthesizing module '%s'%s4497*oasys2
cache2default:default2
 2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
32default:default8@Z8-6157h px? 
b
%s
*synth2J
6	Parameter LINE_ADDR_LEN bound to: 3 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter SET_ADDR_LEN bound to: 3 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter TAG_ADDR_LEN bound to: 6 - type: integer 
2default:defaulth p
x
? 
\
%s
*synth2D
0	Parameter WAY_CNT bound to: 8 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter MEM_ADDR_LEN bound to: 9 - type: integer 
2default:defaulth p
x
? 
e
%s
*synth2M
9	Parameter UNUSED_ADDR_LEN bound to: 18 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter LINE_SIZE bound to: 8 - type: integer 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter SET_SIZE bound to: 8 - type: integer 
2default:defaulth p
x
? 
?
case item %s is unreachable151*oasys2"
10'b01000000002default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
822default:default8@Z8-151h px? 
?
case item %s is unreachable151*oasys2"
10'b10000000002default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
832default:default8@Z8-151h px? 
?
-case statement is not full and has no default155*oasys2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
1032default:default8@Z8-155h px? 
?
synthesizing module '%s'%s4497*oasys2
main_mem2default:default2
 2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
22default:default8@Z8-6157h px? 
b
%s
*synth2J
6	Parameter LINE_ADDR_LEN bound to: 3 - type: integer 
2default:defaulth p
x
? 
]
%s
*synth2E
1	Parameter ADDR_LEN bound to: 9 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter RD_CYCLE bound to: 50 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter WR_CYCLE bound to: 50 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter LINE_SIZE bound to: 8 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'%s4497*oasys2
mem2default:default2
 2default:default2E
/F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/mem.sv2default:default2
22default:default8@Z8-6157h px? 
^
%s
*synth2F
2	Parameter ADDR_LEN bound to: 12 - type: integer 
2default:defaulth p
x
? 
`
%s
*synth2H
4	Parameter MEM_SIZE bound to: 4096 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mem2default:default2
 2default:default2
12default:default2
12default:default2E
/F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/mem.sv2default:default2
22default:default8@Z8-6155h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2 
rd_delay_reg2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
362default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2 
wr_delay_reg2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
372default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2"
rd_line_reg[0]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2"
rd_line_reg[1]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2"
rd_line_reg[2]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2"
rd_line_reg[3]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2"
rd_line_reg[4]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2"
rd_line_reg[5]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2"
rd_line_reg[6]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2"
rd_line_reg[7]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2(
rd_line_latch_reg[0]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2(
rd_line_latch_reg[1]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2(
rd_line_latch_reg[2]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2(
rd_line_latch_reg[3]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2(
rd_line_latch_reg[4]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2(
rd_line_latch_reg[5]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2(
rd_line_latch_reg[6]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2(
rd_line_latch_reg[7]2default:default2
main_mem2default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
872default:default8@Z8-5788h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
main_mem2default:default2
 2default:default2
22default:default2
12default:default2J
4F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/main_mem.sv2default:default2
22default:default8@Z8-6155h px? 
?
case item %s is unreachable151*oasys2"
10'b01000000002default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
2052default:default8@Z8-151h px? 
?
case item %s is unreachable151*oasys2"
10'b10000000002default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
2062default:default8@Z8-151h px? 
?
case item %s is unreachable151*oasys2"
10'b01000000002default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
2742default:default8@Z8-151h px? 
?
case item %s is unreachable151*oasys2"
10'b10000000002default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
2752default:default8@Z8-151h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
max_reg2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
2472default:default8@Z8-6014h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[0][0]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[0][1]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[0][2]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[0][3]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[0][4]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[0][5]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[0][6]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[0][7]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[1][0]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[1][1]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[1][2]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[1][3]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[1][4]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[1][5]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[1][6]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[1][7]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[2][0]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[2][1]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[2][2]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[2][3]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[2][4]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[2][5]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[2][6]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[2][7]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[3][0]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[3][1]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[3][2]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[3][3]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[3][4]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[3][5]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[3][6]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[3][7]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[4][0]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[4][1]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[4][2]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[4][3]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[4][4]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[4][5]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[4][6]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[4][7]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[5][0]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[5][1]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[5][2]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[5][3]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[5][4]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[5][5]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[5][6]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[5][7]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[6][0]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[6][1]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[6][2]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[6][3]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[6][4]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[6][5]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[6][6]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[6][7]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[7][0]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[7][1]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[7][2]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[7][3]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[7][4]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[7][5]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[7][6]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
dirty_reg[7][7]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
932default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[0][0]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[0][1]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[0][2]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[0][3]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[0][4]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[0][5]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[0][6]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[0][7]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[1][0]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[1][1]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[1][2]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[1][3]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[1][4]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[1][5]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[1][6]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[1][7]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[2][0]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2#
valid_reg[2][1]2default:default2
cache2default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
942default:default8@Z8-5788h px? 
?
?Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-57882default:default2
1002default:defaultZ17-14h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
cache2default:default2
 2default:default2
32default:default2
12default:default2G
1F:/1fr/HWnLABS/CA/labs/lab3/CacheSrcCode/cache.sv2default:default2
32default:default8@Z8-6155h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[31]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[30]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[29]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[28]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[27]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[26]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[25]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[24]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[23]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[22]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[21]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[20]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[19]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[18]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[17]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[16]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[15]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[14]2default:defaultZ8-3331h px? 
{
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[1]2default:defaultZ8-3331h px? 
{
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[0]2default:defaultZ8-3331h px? 
?
%s*synth2?
sFinished Synthesize : Time (s): cpu = 00:00:21 ; elapsed = 00:00:22 . Memory (MB): peak = 626.621 ; gain = 369.383
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
~Finished Constraint Validation : Time (s): cpu = 00:00:24 ; elapsed = 00:00:26 . Memory (MB): peak = 626.621 ; gain = 369.383
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7k70tfbv676-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:24 ; elapsed = 00:00:26 . Memory (MB): peak = 626.621 ; gain = 369.383
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
Loading part %s157*device2#
xc7k70tfbv676-12default:defaultZ21-403h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2(
rd_line_latch_reg[0]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2(
rd_line_latch_reg[1]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2(
rd_line_latch_reg[2]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2(
rd_line_latch_reg[3]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2(
rd_line_latch_reg[4]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2(
rd_line_latch_reg[5]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2(
rd_line_latch_reg[6]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2(
rd_line_latch_reg[7]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2"
cache_stat_reg2default:default2
cache2default:defaultZ8-802h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
way_addr2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][0]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][0]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][1]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][1]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][2]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][2]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][3]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][3]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][4]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][4]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][5]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][5]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][6]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][6]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][7]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][7]2default:defaultZ8-5546h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
LRU_addr2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][0]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][1]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][2]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][3]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][4]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][5]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][6]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][7]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2

cache_stat2default:default2
12default:default2
52default:defaultZ8-5544h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
way_addr2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2#
dirty_reg[0][0]2default:default2
12default:default2
52default:defaultZ8-5544h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][0]2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2#
dirty_reg[0][1]2default:default2
12default:default2
52default:defaultZ8-5544h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][1]2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2#
dirty_reg[0][2]2default:default2
12default:default2
52default:defaultZ8-5544h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][2]2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2#
dirty_reg[0][3]2default:default2
12default:default2
52default:defaultZ8-5544h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][3]2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2#
dirty_reg[0][4]2default:default2
12default:default2
52default:defaultZ8-5544h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][4]2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2#
dirty_reg[0][5]2default:default2
12default:default2
52default:defaultZ8-5544h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][5]2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2#
dirty_reg[0][6]2default:default2
12default:default2
52default:defaultZ8-5544h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][6]2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2#
dirty_reg[0][7]2default:default2
12default:default2
52default:defaultZ8-5544h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][7]2default:defaultZ8-5546h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
LRU_addr2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][0]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][1]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][2]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][3]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][4]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][5]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][6]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2*
cache_mem_reg[0][0][7]2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2

cache_stat2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
dirty2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                    IDLE |                             0001 | 00000000000000000000000000000000
2default:defaulth p
x
? 
?
%s
*synth2s
_                SWAP_OUT |                             0010 | 00000000000000000000000000000001
2default:defaulth p
x
? 
?
%s
*synth2s
_                 SWAP_IN |                             0100 | 00000000000000000000000000000010
2default:defaulth p
x
? 
?
%s
*synth2s
_              SWAP_IN_OK |                             1000 | 00000000000000000000000000000011
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2"
cache_stat_reg2default:default2
one-hot2default:default2
cache2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:58 ; elapsed = 00:00:57 . Memory (MB): peak = 659.566 ; gain = 402.328
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
\
%s
*synth2D
0+------+--------------+------------+----------+
2default:defaulth p
x
? 
\
%s
*synth2D
0|      |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
\
%s
*synth2D
0+------+--------------+------------+----------+
2default:defaulth p
x
? 
\
%s
*synth2D
0|1     |cache__GB0    |           1|     42286|
2default:defaulth p
x
? 
\
%s
*synth2D
0|2     |cache__GB1    |           1|      8690|
2default:defaulth p
x
? 
\
%s
*synth2D
0|3     |cache__GB2    |           1|     10630|
2default:defaulth p
x
? 
\
%s
*synth2D
0|4     |cache__GB3    |           1|     12864|
2default:defaulth p
x
? 
\
%s
*synth2D
0|5     |cache__GB4    |           1|     17536|
2default:defaulth p
x
? 
\
%s
*synth2D
0+------+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 66    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 2     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 605   
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               12 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                9 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                6 Bit    Registers := 65    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 129   
2default:defaulth p
x
? 
8
%s
*synth2 
+---RAMs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	             128K Bit         RAMs := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 397   
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input     32 Bit        Muxes := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     12 Bit        Muxes := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   9 Input      3 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1131  
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 836   
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
? 
:
%s
*synth2"
Module cache 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 64    
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 585   
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                9 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                6 Bit    Registers := 65    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 128   
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input     32 Bit        Muxes := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 390   
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      9 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   9 Input      3 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1121  
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 836   
2default:defaulth p
x
? 
8
%s
*synth2 
Module mem 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
+---RAMs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	             128K Bit         RAMs := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
Module main_mem 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 2     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 19    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               12 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                9 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 7     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     12 Bit        Muxes := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 10    
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
]
%s
*synth2E
1Warning: Parallel synthesis criteria is not met 
2default:defaulth p
x
? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
way_addr2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][0]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][1]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][2]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][3]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][4]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][5]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][6]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
dirty_reg[0][7]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
valid_reg[0][0]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
valid_reg[0][1]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
valid_reg[0][2]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
valid_reg[0][3]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
valid_reg[0][4]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
valid_reg[0][5]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
valid_reg[0][7]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
valid_reg[0][6]2default:defaultZ8-5546h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
LRU_addr2default:defaultZ8-5546h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[31]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[30]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[29]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[28]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[27]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[26]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[25]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[24]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[23]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[22]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[21]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[20]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[19]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[18]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[17]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[16]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[15]2default:defaultZ8-3331h px? 
|
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[14]2default:defaultZ8-3331h px? 
{
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[1]2default:defaultZ8-3331h px? 
{
!design %s has unconnected port %s3331*oasys2
cache2default:default2
addr[0]2default:defaultZ8-3331h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys21
i_2/mem_rd_switch_addr_reg[6]2default:default2
FDCE2default:default21
i_2/mem_rd_switch_addr_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys21
i_2/mem_rd_switch_addr_reg[4]2default:default2
FDCE2default:default21
i_2/mem_rd_switch_addr_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys21
i_2/mem_rd_switch_addr_reg[3]2default:default2
FDCE2default:default21
i_2/mem_rd_switch_addr_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys21
i_2/mem_rd_switch_addr_reg[5]2default:default2
FDCE2default:default21
i_2/mem_rd_switch_addr_reg[7]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2/
\mem_rd_switch_addr_reg[7] 2default:defaultZ8-3333h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:02:13 ; elapsed = 00:02:13 . Memory (MB): peak = 878.840 ; gain = 621.602
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
e
%s*synth2M
9
Block RAM: Preliminary Mapping  Report (see note below)
2default:defaulth px? 
?
%s*synth2?
?+------------+--------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth px? 
?
%s*synth2?
?|Module Name | RTL Object   | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
2default:defaulth px? 
?
%s*synth2?
?+------------+--------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth px? 
?
%s*synth2?
?|mem:        | ram_cell_reg | 4 K x 32(READ_FIRST)   | W | R |                        |   |   | Port A           | 0      | 4      | 
2default:defaulth px? 
?
%s*synth2?
?+------------+--------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

2default:defaulth px? 
?
%s*synth2?
?Note: The tale above is a preliminary report that shows the Block RAMs at the current stage of the synthesis flow. Some Block RAMs may be reimplemented as non Block RAM primitives later in the synthesis flow. Multiple instantiated Block RAMs are reported only once. 
2default:defaulth px? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
?
?The timing for the instance %s (implemented as a block RAM) might be sub-optimal as no optional output register could be merged into the block ram. Providing additional output register may help in improving timing.
3630*oasys2E
1i_0/main_mem_instance/i_0/mem_inst/ram_cell_reg_02default:defaultZ8-4480h px? 
?
?The timing for the instance %s (implemented as a block RAM) might be sub-optimal as no optional output register could be merged into the block ram. Providing additional output register may help in improving timing.
3630*oasys2E
1i_0/main_mem_instance/i_0/mem_inst/ram_cell_reg_12default:defaultZ8-4480h px? 
?
?The timing for the instance %s (implemented as a block RAM) might be sub-optimal as no optional output register could be merged into the block ram. Providing additional output register may help in improving timing.
3630*oasys2E
1i_0/main_mem_instance/i_0/mem_inst/ram_cell_reg_22default:defaultZ8-4480h px? 
?
?The timing for the instance %s (implemented as a block RAM) might be sub-optimal as no optional output register could be merged into the block ram. Providing additional output register may help in improving timing.
3630*oasys2E
1i_0/main_mem_instance/i_0/mem_inst/ram_cell_reg_32default:defaultZ8-4480h px? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
\
%s
*synth2D
0+------+--------------+------------+----------+
2default:defaulth p
x
? 
\
%s
*synth2D
0|      |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
\
%s
*synth2D
0+------+--------------+------------+----------+
2default:defaulth p
x
? 
\
%s
*synth2D
0|1     |cache__GB0    |           1|     10843|
2default:defaulth p
x
? 
\
%s
*synth2D
0|2     |cache__GB1    |           1|      6501|
2default:defaulth p
x
? 
\
%s
*synth2D
0|3     |cache__GB2    |           1|      4069|
2default:defaulth p
x
? 
\
%s
*synth2D
0|4     |cache__GB3    |           1|     12864|
2default:defaulth p
x
? 
\
%s
*synth2D
0|5     |cache__GB4    |           1|     17536|
2default:defaulth p
x
? 
\
%s
*synth2D
0+------+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Timing Optimization : Time (s): cpu = 00:02:13 ; elapsed = 00:02:14 . Memory (MB): peak = 878.840 ; gain = 621.602
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
N
%s
*synth26
"
Block RAM: Final Mapping  Report
2default:defaulth p
x
? 
?
%s
*synth2?
?+------------+--------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth p
x
? 
?
%s
*synth2?
?|Module Name | RTL Object   | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
2default:defaulth p
x
? 
?
%s
*synth2?
?+------------+--------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
2default:defaulth p
x
? 
?
%s
*synth2?
?|mem:        | ram_cell_reg | 4 K x 32(READ_FIRST)   | W | R |                        |   |   | Port A           | 0      | 4      | 
2default:defaulth p
x
? 
?
%s
*synth2?
?+------------+--------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

2default:defaulth p
x
? 
?
%s
*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
\
%s
*synth2D
0+------+--------------+------------+----------+
2default:defaulth p
x
? 
\
%s
*synth2D
0|      |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
\
%s
*synth2D
0+------+--------------+------------+----------+
2default:defaulth p
x
? 
\
%s
*synth2D
0|1     |cache__GB0    |           1|     10843|
2default:defaulth p
x
? 
\
%s
*synth2D
0|2     |cache__GB1    |           1|      6501|
2default:defaulth p
x
? 
\
%s
*synth2D
0|3     |cache__GB2    |           1|      4069|
2default:defaulth p
x
? 
\
%s
*synth2D
0|4     |cache__GB3    |           1|     12864|
2default:defaulth p
x
? 
\
%s
*synth2D
0|5     |cache__GB4    |           1|     17536|
2default:defaulth p
x
? 
\
%s
*synth2D
0+------+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
?The timing for the instance %s (implemented as a block RAM) might be sub-optimal as no optional output register could be merged into the block ram. Providing additional output register may help in improving timing.
3630*oasys2=
)main_mem_instance/mem_inst/ram_cell_reg_02default:defaultZ8-4480h px? 
?
?The timing for the instance %s (implemented as a block RAM) might be sub-optimal as no optional output register could be merged into the block ram. Providing additional output register may help in improving timing.
3630*oasys2=
)main_mem_instance/mem_inst/ram_cell_reg_12default:defaultZ8-4480h px? 
?
?The timing for the instance %s (implemented as a block RAM) might be sub-optimal as no optional output register could be merged into the block ram. Providing additional output register may help in improving timing.
3630*oasys2=
)main_mem_instance/mem_inst/ram_cell_reg_22default:defaultZ8-4480h px? 
?
?The timing for the instance %s (implemented as a block RAM) might be sub-optimal as no optional output register could be merged into the block ram. Providing additional output register may help in improving timing.
3630*oasys2=
)main_mem_instance/mem_inst/ram_cell_reg_32default:defaultZ8-4480h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Technology Mapping : Time (s): cpu = 00:02:27 ; elapsed = 00:02:28 . Memory (MB): peak = 878.840 ; gain = 621.602
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
uFinished IO Insertion : Time (s): cpu = 00:02:34 ; elapsed = 00:02:35 . Memory (MB): peak = 878.840 ; gain = 621.602
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:02:35 ; elapsed = 00:02:35 . Memory (MB): peak = 878.840 ; gain = 621.602
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:02:36 ; elapsed = 00:02:37 . Memory (MB): peak = 878.840 ; gain = 621.602
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:02:36 ; elapsed = 00:02:37 . Memory (MB): peak = 878.840 ; gain = 621.602
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:02:39 ; elapsed = 00:02:40 . Memory (MB): peak = 878.840 ; gain = 621.602
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:02:39 ; elapsed = 00:02:40 . Memory (MB): peak = 878.840 ; gain = 621.602
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
F
%s*synth2.
+------+---------+------+
2default:defaulth px? 
F
%s*synth2.
|      |Cell     |Count |
2default:defaulth px? 
F
%s*synth2.
+------+---------+------+
2default:defaulth px? 
F
%s*synth2.
|1     |BUFG     |     1|
2default:defaulth px? 
F
%s*synth2.
|2     |CARRY4   |   557|
2default:defaulth px? 
F
%s*synth2.
|3     |LUT1     |     4|
2default:defaulth px? 
F
%s*synth2.
|4     |LUT2     |  1213|
2default:defaulth px? 
F
%s*synth2.
|5     |LUT3     |   294|
2default:defaulth px? 
F
%s*synth2.
|6     |LUT4     |   532|
2default:defaulth px? 
F
%s*synth2.
|7     |LUT5     |   444|
2default:defaulth px? 
F
%s*synth2.
|8     |LUT6     |  9017|
2default:defaulth px? 
F
%s*synth2.
|9     |MUXF7    |  2892|
2default:defaulth px? 
F
%s*synth2.
|10    |MUXF8    |     2|
2default:defaulth px? 
F
%s*synth2.
|11    |RAMB36E1 |     4|
2default:defaulth px? 
F
%s*synth2.
|12    |FDCE     |  2543|
2default:defaulth px? 
F
%s*synth2.
|13    |FDPE     |     1|
2default:defaulth px? 
F
%s*synth2.
|14    |FDRE     | 17352|
2default:defaulth px? 
F
%s*synth2.
|15    |IBUF     |    48|
2default:defaulth px? 
F
%s*synth2.
|16    |OBUF     |    33|
2default:defaulth px? 
F
%s*synth2.
+------+---------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
[
%s
*synth2C
/+------+--------------------+---------+------+
2default:defaulth p
x
? 
[
%s
*synth2C
/|      |Instance            |Module   |Cells |
2default:defaulth p
x
? 
[
%s
*synth2C
/+------+--------------------+---------+------+
2default:defaulth p
x
? 
[
%s
*synth2C
/|1     |top                 |         | 34937|
2default:defaulth p
x
? 
[
%s
*synth2C
/|2     |  main_mem_instance |main_mem |  1095|
2default:defaulth p
x
? 
[
%s
*synth2C
/|3     |    mem_inst        |mem      |     4|
2default:defaulth p
x
? 
[
%s
*synth2C
/+------+--------------------+---------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:02:39 ; elapsed = 00:02:40 . Memory (MB): peak = 878.840 ; gain = 621.602
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
t
%s
*synth2\
HSynthesis finished with 0 errors, 0 critical warnings and 770 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Runtime : Time (s): cpu = 00:02:39 ; elapsed = 00:02:40 . Memory (MB): peak = 878.840 ; gain = 621.602
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Complete : Time (s): cpu = 00:02:39 ; elapsed = 00:02:40 . Memory (MB): peak = 878.840 ; gain = 621.602
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
h
-Analyzing %s Unisim elements for replacement
17*netlist2
35032default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
12default:defaultZ29-28h px? 
?
?Netlist '%s' is not ideal for floorplanning, since the cellview '%s' contains a large number of primitives.  Please consider enabling hierarchy in synthesis if you want to do floorplanning.
310*netlist2
cache2default:default2
cache2default:defaultZ29-101h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1132default:default2
1482default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:02:592default:default2
00:03:022default:default2
878.8402default:default2
634.2382default:defaultZ17-268h px? 
K
"No constraint will be written out.1103*constraintsZ18-5210h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2T
@F:/1fr/HWnLABS/CA/labs/lab3/Level1/Level1.runs/synth_1/cache.dcp2default:defaultZ17-1381h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:082default:default2
00:00:072default:default2
878.8402default:default2
0.0002default:defaultZ17-268h px? 
?
%s4*runtcl2t
`Executing : report_utilization -file cache_utilization_synth.rpt -pb cache_utilization_synth.pb
2default:defaulth px? 
?
sreport_utilization: Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.635 . Memory (MB): peak = 878.840 ; gain = 0.000
*commonh px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sun May 17 15:51:01 20202default:defaultZ17-206h px? 


End Record