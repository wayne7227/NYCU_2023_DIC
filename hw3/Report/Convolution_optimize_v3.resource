 
****************************************
Report : resources
Design : Convolution_optimize_v3
Version: T-2022.03
Date   : Thu Nov  9 00:02:28 2023
****************************************

Resource Sharing Report for design Convolution_optimize_v3 in file
        ./Convolution_optimize_v3.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r394     | DW01_inc     | width=7    |               | add_74               |
| r396     | DW_cmp       | width=7    |               | gte_81               |
| r1130    | DW_mult_uns  | a_width=16 |               | mult_164             |
|          |              | b_width=16 |               |                      |
| r1846    | DW_mult_uns  | a_width=16 |               | mult_165             |
|          |              | b_width=16 |               |                      |
| r2562    | DW_mult_uns  | a_width=16 |               | mult_166             |
|          |              | b_width=16 |               |                      |
| r3278    | DW_mult_uns  | a_width=16 |               | mult_167             |
|          |              | b_width=16 |               |                      |
| r3994    | DW_mult_uns  | a_width=16 |               | mult_168             |
|          |              | b_width=16 |               |                      |
| r4710    | DW_mult_uns  | a_width=16 |               | mult_169             |
|          |              | b_width=16 |               |                      |
| r5426    | DW_mult_uns  | a_width=16 |               | mult_170             |
|          |              | b_width=16 |               |                      |
| r6142    | DW_mult_uns  | a_width=16 |               | mult_171             |
|          |              | b_width=16 |               |                      |
| r6858    | DW_mult_uns  | a_width=16 |               | mult_172             |
|          |              | b_width=16 |               |                      |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| mult_164           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_165           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_166           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_167           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_168           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_169           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_170           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_171           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_172           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| add_74             | DW01_inc         | rpl                |                |
===============================================================================

1
