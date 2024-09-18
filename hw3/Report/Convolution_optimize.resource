Warning: Design 'Convolution_optimize' has '1' unresolved references. For more detailed information, use the "link" command. (UID-341)
 
****************************************
Report : resources
Design : Convolution_optimize
Version: T-2022.03
Date   : Wed Nov  8 23:35:13 2023
****************************************

Resource Sharing Report for design Convolution_optimize in file
        ./Convolution_optimize.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r459     | DW01_cmp6    | width=7    |               | lt_89 lte_130        |
| r473     | DW01_cmp2    | width=7    |               | gte_221 lt_219       |
| r474     | DW01_cmp2    | width=7    |               | gte_223 lt_221       |
| r475     | DW01_cmp2    | width=7    |               | gte_225 lt_223       |
| r476     | DW01_cmp2    | width=7    |               | gte_227 lt_225       |
| r501     | DW01_inc     | width=7    |               | add_90               |
| r503     | DW_cmp       | width=7    |               | gt_100               |
| r505     | DW_cmp       | width=7    |               | gte_130              |
| r525     | DW01_sub     | width=7    |               | sub_217              |
| r527     | DW_cmp       | width=7    |               | lt_227               |
| r529     | DW01_add     | width=7    |               | add_222              |
| r531     | DW01_add     | width=7    |               | add_224              |
| r533     | DW01_add     | width=7    |               | add_226              |
| r535     | DW01_add     | width=7    |               | add_228              |
| r1251    | DW_mult_uns  | a_width=16 |               | mult_148             |
|          |              | b_width=16 |               |                      |
| r1967    | DW_mult_uns  | a_width=16 |               | mult_140             |
|          |              | b_width=16 |               |                      |
| r2683    | DW_mult_uns  | a_width=16 |               | mult_142             |
|          |              | b_width=16 |               |                      |
| r3399    | DW_mult_uns  | a_width=16 |               | mult_143             |
|          |              | b_width=16 |               |                      |
| r4115    | DW_mult_uns  | a_width=16 |               | mult_141             |
|          |              | b_width=16 |               |                      |
| r4831    | DW_mult_uns  | a_width=16 |               | mult_144             |
|          |              | b_width=16 |               |                      |
| r5547    | DW_mult_uns  | a_width=16 |               | mult_146             |
|          |              | b_width=16 |               |                      |
| r6263    | DW_mult_uns  | a_width=16 |               | mult_145             |
|          |              | b_width=16 |               |                      |
| r6979    | DW_mult_uns  | a_width=16 |               | mult_147             |
|          |              | b_width=16 |               |                      |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| mult_140           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_141           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_142           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_143           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_144           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_145           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_146           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_147           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_148           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| add_90             | DW01_inc         | rpl                |                |
===============================================================================

1
